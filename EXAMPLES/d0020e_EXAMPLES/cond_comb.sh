echo 'Load policies'
curl -s -G "http://127.0.0.1:8001/paapi/loadpol" --data-urlencode "policyfile=EXAMPLES/d0020e_EXAMPLES/context_combine1.pl" --data-urlencode "token=admin_token"
curl -s -G "http://127.0.0.1:8001/paapi/loadpol" --data-urlencode "policyfile=EXAMPLES/d0020e_EXAMPLES/context_combine2.pl" --data-urlencode "token=admin_token"
curl -s -G "http://127.0.0.1:8001/paapi/combinepol?policy1=context_combine1&policy2=context_combine2&combined=combined&token=admin_token"
echo 'Set the policy to combined '
curl -s -G "http://127.0.0.1:8001/paapi/setpol?policy=combined" --data-urlencode "token=admin_token"
echo 'read the policy (explicitly named as combined)'
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=combined" --data-urlencode "token=admin_token"
echo 'Set the condition needed for the policy'
echo 'Set Access query - if Friday deny, deny, deny else grant, grant, grant'
curl -s "http://127.0.0.1:8001/pqapi/access?user=Ulf&object=Secret_Document&ar=read"
curl -s "http://127.0.0.1:8001/pqapi/access?user=Ulf&object=Secret_Document&ar=read"
curl -s "http://127.0.0.1:8001/pqapi/access?user=Ulf&object=Secret_Document&ar=read"
