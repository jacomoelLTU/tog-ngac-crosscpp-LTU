policy('context_combine2','Project Access', [

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

       cond(current_day_is_one_of(['Monday','Tuesday','Wednesday'/*,'Thursday', 'Friday'*/]),  [
       	associate('Boss',[read],'Boss_Documents')
       ])
]).
