policy('combine2','Project Access', [

       user('Ulf'),

       user_attribute('Boss'),
       
       object('Secret_Document'),
       
       object_attribute('Boss_Documents'),

       policy_class('Project Access'),

       connector('PM'),
       
       assign('Ulf','Boss'),
       assign('Secret_Document','Boss_Documents'),
       
       assign('Boss_Documents','Project Access'),
       assign('Boss','Project Access'),
       assign('Project Access','PM'),

       operation(read,'Book'),
	operation(write,'Book'),
	
       associate('Boss',[read],'Boss_Documents')
]).
