policy('test_graph_pol','access', [

	user('Ilaman'),
	user('Jesper'),
	user('Emil'),
	user('Birger'),
	
	user_attribute('Team'),
	user_attribute('Team2'),
	
	object('Secret Document'),
	object('The Hobbit'),
	object('Fellowship of the ring'),
	object('The Two Towers'),
	object('Return of the king'),
	
	object_attribute('Books'),
	object_attribute('Documents'),
	object_attribute('Lord of the rings'),
	
	policy_class('access'),
	
	connector('PM'),
	
	assign('Ilaman','Team'),
	assign('Jesper','Team'),
	assign('Emil','Team'),
	assign('Birger','Team'),
	assign('Jesper','Team2'),
	assign('The Hobbit','Books'),
	assign('Fellowship of the ring','Lord of the rings'),
	assign('The Two Towers','Lord of the rings'),
	assign('Return of the king','Lord of the rings'),
	assign('Secret Document','Documents'),
	assign('Team','access'),
	assign('Team2','access'),
	assign('Books','access'),
	assign('Documents','access'),
	assign('Lord of the rings','access'),
	assign('access','PM'),
	
	associate('Team',[w],'Books'),
	associate('Team',[r],'Documents'),
	associate('Team',[w],'Lord of the rings'),
	associate('Team',[r],'Lord of the rings'),
	associate('Team2',[w],'Documents')
]).
