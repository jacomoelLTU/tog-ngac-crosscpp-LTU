policy('sosngacdemo','test', [

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

]).
