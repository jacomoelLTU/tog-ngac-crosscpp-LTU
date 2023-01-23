policy('sosngacdemo','SoS NGAC Demo', [


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
       
]).
