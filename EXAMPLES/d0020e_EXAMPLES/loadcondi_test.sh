echo 'Load policie'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol" --data-urlencode "policyfile=EXAMPLES/d0020e_EXAMPLES/context_test.pl" --data-urlencode "token=admin_token"
echo ''
echo 'Set the policy to context_test '
curl -s -G "http://127.0.0.1:8001/paapi/setpol?policy=context_test" --data-urlencode "token=admin_token"
echo 'read the policy (explicitly named as context_test)'
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=context_test" --data-urlencode "token=admin_token"
echo 'Set the condition needed for the policy'
echo ''
curl -s -G "http://127.0.0.1:8001/paapi/loadcondi" --data-urlencode "cond_elements=[
	condition_predicate(is_time,[number]),
		(is_min(Min) :-
			condition_variable_value(minute_now,M),
			is_equal_to( Min, M )
	)]" --data-urlencode "token=admin_token"
echo 'Set Access query - D G D'
curl -s "http://127.0.0.1:8001/pqapi/access?user=Ulf&object=Secret_Document&ar=read&cond=is_min(8)"
curl -s "http://127.0.0.1:8001/pqapi/access?user=Ulf&object=Secret_Document&ar=read&cond=is_min(9)"
curl -s "http://127.0.0.1:8001/pqapi/access?user=Ulf&object=Secret_Document&ar=read&cond=is_min(10)"
