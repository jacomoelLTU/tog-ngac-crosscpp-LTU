echo 'Load policies'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol?policyfile=EXAMPLES/d0020e_EXAMPLES/policy_book.pl&token=admin_token"
echo 'set to test_policy_book'
curl -s -G "http://127.0.0.1:8001/paapi/setpol?policy=test_policy_book&token=admin_token"
echo 'get the policy'
curl -s -G "http://127.0.0.1:8001/paapi/getpol?token=admin_token"
echo 'test test_policy_book expect grant, grant, grant, grant, grant, deny, grant, deny'
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=jesper&ar=r&object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=ilaman&ar=r&object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=jesper&ar=r&object=bible"
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=ilaman&ar=r&object=bible"
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=jesper&ar=w&object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=ilaman&ar=w&object=bible"
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=jesper&ar=w&object=hobbit"
curl -s -G "http://127.0.0.1:8001/pqapi/access?user=ilaman&ar=w&object=bible"
