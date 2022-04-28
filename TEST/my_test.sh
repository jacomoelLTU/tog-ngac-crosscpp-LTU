echo 'set to Policy 1'
curl -s -G "http://127.0.0.1:8001/paapi/setpol" --data-urlencode "policy=Policy1" --data-urlencode "token=admin_token"
echo 'get the policy'
curl -s -G "http://127.0.0.1:8001/paapi/getpol" --data-urlencode "token=admin_token"
echo 'test policy 1 expect grant, deny, deny, grant, deny grant'
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=u1" --data-urlencode "ar=w" --data-urlencode "object=o1"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=u2" --data-urlencode "ar=w" --data-urlencode "object=o1"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=u1" --data-urlencode "ar=w" --data-urlencode "object=o2"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=u2" --data-urlencode "ar=w" --data-urlencode "object=o2"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=u1" --data-urlencode "ar=w" --data-urlencode "object=o3"
curl -s -G "http://127.0.0.1:8001/pqapi/access" --data-urlencode "user=u2" --data-urlencode "ar=w" --data-urlencode "object=o3"
