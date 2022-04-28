echo 'Event Triggered Response Test'

echo 'Load policies'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol?policyfile=EXAMPLES/d0020e_EXAMPLES/policy_book.pl&token=admin_token"

echo 'set to test_policy_book'
curl -s -G "http://127.0.0.1:8001/paapi/setpol?policy=test_policy_book&token=admin_token"

echo 'get the policy'
curl -s -G "http://127.0.0.1:8001/paapi/getpol?token=admin_token"

echo 'read the policy'
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=test_policy_book" --data-urlencode "token=admin_token"


echo report events
curl -s -G "http://127.0.0.1:8001/epp/report_event" --data-urlencode "event=event(test_event,user(Emil), policy_class(pc),operation(addone),object(readers))" --data-urlencode "token=epp_token"


echo End of Event Triggered Response Test