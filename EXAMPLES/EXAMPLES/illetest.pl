policy('illetest','Project Access', [

	user('u1'),


	user_attribute('ua1'),


	object('o1'),


	object_attribute('oa1'),


	policy_class('Project Access'),
	connector('PM'),

	assign('u1','ua1'),
	assign('o1','oa1'),
       
	assign('ua1', 'Project Access'),
	assign('oa1','Project Access'),
	assign('ProjectAccess','PM'),
       
       cond(time_conditional_read(_,_), associate('ua1',[r,w],'oa1')  )
       
]).
