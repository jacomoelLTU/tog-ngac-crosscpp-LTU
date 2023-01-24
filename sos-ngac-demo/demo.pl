policy('sosngacdemo','test', [

<<<<<<< HEAD
	user('User1'),
	user('User2'),
	user('User3'),

	user_attribute('Group1'),
	user_attribute('Group2'),

	object('S1'),
	object('S2'),
	object('S3'),

	object_attribute('TempSensor'),
	object_attribute('Thermostat'),

	policy_class('test'),
	connector('PM'),

	assign('User1','Group1'),
	assign('User2','Group1'),
	assign('User3', 'Group2'),

	assign('S1', 'TempSensor'),
	assign('S2', 'TempSensor'),
	assing('S3', 'Thermostat'),

	assign('Group1', 'test'),
	assign('Group2', 'test'),
	assign('TempSensor', 'test'),
	assign('Thermostat', 'test'),
	assign('test', 'PM'),

	associate('Group1', [r], 'TempSensor'),
	associate('Group2', [r,w], 'Thermostat')

=======

	 user('User'),
	 user('Sensor'),
	 user('Admin'),
	 user_attribute('HostA'),
	 user_attribute('SensorA'),
	 user_attribute('Administrator'),
	 object('SensorData'),
	 object_attribute('ZoneA'),
	 policy_class('SoS NGAC Demo'),
	 connector('PM'),
	 assign('User','HostA'),
	 assign('Sensor','SensorA'),
	 assign('SensorData','ZoneA'),
	 assign('Admin','Administrator'),
      
	 assign('HostA', 'SoS NGAC Demo'),
	 assign('SensorA','SoS NGAC Demo'),
	 assign('ZoneA','SoS NGAC Demo'),
	 assign('Administrator','SoS NGAC Demo'),
	 assign('SoS NGAC Demo','PM'),

	 associate('SensorA',[w],'ZoneA'),
	 associate('Administrator',[r,w],'ZoneA'),
      
	 cond(time_conditional_read(_,_), associate('HostA',[r],'ZoneA')  )
       
>>>>>>> 5937b710e7e427713e5909c71fbe00f4f65416e4
]).
