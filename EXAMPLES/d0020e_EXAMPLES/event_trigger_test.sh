echo "Custom even trigger test"

echo 'Load policies'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol" --data-urlencode "policyfile=EXAMPLES/d0020e_EXAMPLES/policy_book.pl" --data-urlencode "token=admin_token"
echo 'set to test_policy_book'
curl -s -G "http://127.0.0.1:8001/paapi/setpol" --data-urlencode "policy=test_policy_book" --data-urlencode "token=admin_token"
echo 'get the policy'
curl -s -G "http://127.0.0.1:8001/paapi/getpol" --data-urlencode "token=admin_token"
echo 'test test_policy_book expect grant, grant, grant, grant, grant, deny, grant, deny'
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=jesper" --data-urlencode "ar=r" --data-urlencode "object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=ilaman" --data-urlencode "ar=r" --data-urlencode "object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=jesper" --data-urlencode "ar=r" --data-urlencode "object=bible"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=ilaman" --data-urlencode "ar=r" --data-urlencode "object=bible"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=jesper" --data-urlencode "ar=w" --data-urlencode "object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=ilaman" --data-urlencode "ar=w" --data-urlencode "object=bible"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=jesper" --data-urlencode "ar=w" --data-urlencode "object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=ilaman" --data-urlencode "ar=w" --data-urlencode "object=bible"

echo "report events"
curl -s -G "http://127.0.0.1:8001/epp/report_event" --data-urlencode "event=test_event" --data-urlencode "token=epp_token"
curl -s -G "http://127.0.0.1:8001/epp/report_event" --data-urlencode "event=event(test_event, user(ilaman), policy_class(pc),operation(adnull),object(bible))" --data-urlencode "token=epp_token"

echo "load event response package immediate"
curl -s -G "http://127.0.0.1:8001/epp/loadi_erp" --data-urlencode "erp=er_package(er_test1,[
    er(
        ev_pat(user(any),policy_class(any),operation(adnull),object(any)),
        [addm([]),deletem([])]
    ),
    er(
        ev_pat(user(ilaman),policy_class(any),operation(r),object(any)),
        [add(test_policy_book,user(jesus))]) ])" --data-urlencode "token=epp_token"


echo "read the policy, no changes should have been made"
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=test_policy_book" --data-urlencode "token=admin_token"

curl -s -G "http://127.0.0.1:8001/epp/report_event" --data-urlencode "event=event(test_event,user(ilaman),policy_class(pc),operation(r),object(bible))" --data-urlencode "token=epp_token"

echo "read the policy, jesus should have been added as a user"
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=test_policy_book" --data-urlencode "token=admin_token"
