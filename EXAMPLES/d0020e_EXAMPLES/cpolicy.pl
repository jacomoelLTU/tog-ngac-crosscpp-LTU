policyspec=policy(cpolicy,access,[
	user(u1),
	user_attribute(ua1),
	object(o1),
	object_attribute(oa1),
	policy_class(access),
	connector('PM'),
	assign(u1,ua1),
	assign(o1,oa1),
	assign(ua1,access),
	assign(oa1,access),
	assign(access,'PM'),
	operation(read,'Book'),
	operation(write,'Book'),
	cond( weekday, [
		associate(ua1,[read,write],oa1) 
]).
