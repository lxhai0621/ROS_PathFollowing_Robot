import minimalmodbus as minimodbus
import serial
import numpy as np
import time

class MotorController:

	def __init__(self, port, id):

		self._port = port
		self.ID = id

		
		self.client = minimodbus.Instrument(port, self.ID, 'rtu')
		self.client.serial.baudrate = 115200
		self.client.serial.parity = serial.PARITY_NONE
		self.client.serial.stopbits = 1
		self.client.serial.bytesize = 8
		self.client.serial.timeout = 0.015
		
		###定义通用寄存器地址
		self.MAX_MOTOR_RPM = 0x2008
		self.CONTROL_REG = 0x200E #控制字
		self.OPR_MODE = 0x200D #运行模式
		self.L_ACL_TIME = 0x2080 #左电机加速时间
		self.R_ACL_TIME = 0x2081 #右电机加速时间
		self.L_DCL_TIME = 0x2082 #左电机减速时间
		self.R_DCL_TIME = 0x2083 #右电机减速时间
		self.L_RATED_CUR = 0x2033 #左电机额定电流
		self.L_MAX_CUR = 0x2034 #左电机最大电流
		self.R_RATED_CUR = 0x2063 #右电机额定电流
		self.R_MAX_CUR = 0x2064 #右电机最大电流
		self.DRIVER_TEMP = 0x20B0 #驱动器温度
		self.BUS_VOLTAGE = 0x20A1 #驱动器电压

		## 速度控制参数
		self.L_CMD_RPM = 0x2088 # 左电机目标速度
		self.R_CMD_RPM = 0x2089 #右电机目标速度
		self.L_FB_RPM = 0x20AB # 左电机实时速度反馈
		self.R_FB_RPM = 0x20AC #右电机实时速度反馈

		#错误信息寄存器
		self.L_FAULT = 0x20A5 #左电机故障信息
		self.R_FAULT = 0x20A6 #右电机故障信息

		#控制命令
		self.EMER_STOP = 0x05 #急停
		self.ALRM_CLR = 0x06 #报警清除
		self.DOWN_TIME = 0x07 #停机
		self.ENABLE = 0x08 #使能

		#模式
		self.VEL_CONTROL = 3 #速度模式
		self.ASYNC = 0 #异步模式
		self.SYNC = 1 #同步模式

		#错误代码
		self.NO_FAULT = 0x0000 #无错误
		self.OVER_VOLT = 0x0001 #过压
		self.UNDER_VOLT = 0x0002 #欠压
		self.OVER_CURR = 0x0004 #过流
		self.OVER_LOAD = 0x0008 #过载
		self.CURR_OUT_TOL = 0x0010 #电流超差
		self.ENCOD_OUT_TOL = 0x0020 #编码器超差
		self.MOTOR_BAD = 0x0040 #速度超差
		self.REF_VOLT_ERROR = 0x0080 #参考电压出错
		self.EEPROM_ERROR = 0x0100 #EEPROM错误
		self.WALL_ERROR = 0x0200 #霍尔出错
		self.HIGH_TEMP = 0x0400 #电压温度过高
		self.FAULT_LIST = [self.OVER_VOLT, self.UNDER_VOLT, self.OVER_CURR, self.OVER_LOAD, self.CURR_OUT_TOL, self.ENCOD_OUT_TOL, \
					self.MOTOR_BAD, self.REF_VOLT_ERROR, self.EEPROM_ERROR, self.WALL_ERROR, self.HIGH_TEMP]

		self.READ_HOLDING_REG = 0x03 #读寄存器功能码
		self.CMD_RPM = 0 # RPM
        
	def modbus_fail_read_handler(self, ADDR, WORD):

		read_success = False
		
		while not read_success:
			try:
				result = self.client.read_registers(ADDR, WORD, functioncode=self.READ_HOLDING_REG)
				read_success = True
			except AttributeError as e:
				print(e)
				pass

		return result
	
    #rpm转角速度
	def rpm_to_radPerSec(self, rpm):
		return rpm*2*np.pi/60.0

    #rpm转线速度
	def rpm_to_linear(self, rpm):

		W_Wheel = self.rpm_to_radPerSec(rpm)
		V = W_Wheel*0.1

		return V

    #设置模式
	def set_mode(self, MODE):
		if MODE == 3:
			print("Set speed rpm control")
		else:
			print("set_mode ERROR: set only 3")
			return 0

		result = self.client.write_register(self.OPR_MODE, MODE)
		return result

    #读取模式
	def get_mode(self):

		registers = self.modbus_fail_read_handler(self.OPR_MODE, 1)
		mode = registers[0]

		return mode

    #使能电机
	def enable_motor(self):
		result = self.client.write_register(self.CONTROL_REG, self.ENABLE)

    #失能电机
	def disable_motor(self):
		result = self.client.write_register(self.CONTROL_REG, self.DOWN_TIME)

	def emergency_stop_motor(self):
		result = self.client.write_register(self.CONTROL_REG, self.EMER_STOP)

    #读取错误码
	def get_fault_code(self):

		fault_codes = self.modbus_fail_read_handler(self.L_FAULT, 2)

		L_fault_code = fault_codes[0]
		R_fault_code = fault_codes[1]

		L_fault_flag = L_fault_code in self.FAULT_LIST
		R_fault_flag = R_fault_code in self.FAULT_LIST

		return (L_fault_flag, L_fault_code), (R_fault_flag, R_fault_code)

    #清除报警
	def clear_alarm(self):
		result = self.client.write_register(self.CONTROL_REG, self.ALRM_CLR)

    #设置加速时间
	def set_accel_time(self, L_ms, R_ms):
		result = self.client.write_registers(self.L_ACL_TIME, [int(L_ms),int(R_ms)])

    #设置减速时间
	def set_decel_time(self, L_ms, R_ms):
		result = self.client.write_registers(self.L_DCL_TIME, [int(L_ms), int(R_ms)])

	def int16Dec_to_int16Hex(self,int16):

		lo_byte = (int16 & 0x00FF)
		hi_byte = (int16 & 0xFF00) >> 8
		all_bytes = (hi_byte << 8) | lo_byte

		return all_bytes

    #设置速度
	def set_rpm(self, L_rpm, R_rpm):

		left_bytes = self.int16Dec_to_int16Hex(L_rpm)
		right_bytes = self.int16Dec_to_int16Hex(R_rpm)

		result = self.client.write_registers(self.L_CMD_RPM, [left_bytes, right_bytes])

    #获取速度
	def get_rpm(self):
		registers = self.modbus_fail_read_handler(self.L_FB_RPM, 2)
		fb_L_rpm = np.int16(registers[0])/10.0
		fb_R_rpm = np.int16(registers[1])/10.0

		return fb_L_rpm, fb_R_rpm

    #获取线速度
	def get_linear_velocities(self):

		rpmL, rpmR = self.get_rpm()

		VL = self.rpm_to_linear(rpmL)
		VR = self.rpm_to_linear(-rpmR)

		return VL, VR

    #设置最大速度
	def set_max_rpm(self, MAX_RPM):
		max_rpm = self.int16Dec_to_int16Hex(MAX_RPM)
		result = self.client.write_register(self.MAX_MOTOR_RPM, max_rpm)
		return result
	
    #设置左电机最大电流
	def set_max_L_current(self, MAX_CUR):
		max_cur = self.int16Dec_to_int16Hex(MAX_CUR*10)
		result = self.client.write_register(self.L_MAX_CUR, max_cur)
		return result
	
    #设置右电机最大电流
	def set_max_R_current(self, MAX_CUR):
		max_cur = self.int16Dec_to_int16Hex(MAX_CUR*10)
		result = self.client.write_register(self.R_MAX_CUR, max_cur)
		return result
	
    #获取电压
	def get_voltage(self):
		register = self.modbus_fail_read_handler(self.BUS_VOLTAGE, 1)
		vol = np.float64(register[0]/100.0)
		return vol
	
    #获取驱动器温度
	def get_driver_temp(self):
		register = self.modbus_fail_read_handler(self.DRIVER_TEMP, 1)
		drv_temp = np.float64(register[0]/10.0)
		return drv_temp
	
    #获取驱动器id
	def get_rs485_id(self):
		register = self.modbus_fail_read_handler(0x2001, 1)
		return register