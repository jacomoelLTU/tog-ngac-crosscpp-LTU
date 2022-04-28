echo 'add/delete multiple'
echo 'first load ipolicy immediate'
curl -s -G "http://127.0.0.1:8001/paapi/loadi" --data-urlencode "policyspec=
    policy(ipolicy,access,[
        user(u1),
        user(u2),
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
        associate(ua1,[r,w],oa1)])
    ])." --data-urlencode "token=admin_token"

echo 'set to ipolicy'
curl -s -G "http://127.0.0.1:8001/paapi/setpol" --data-urlencode "policy=ipolicy" --data-urlencode "token=admin_token"

echo 'read the policy (explicitly named as ipolicy)'
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=ipolicy" --data-urlencode "token=admin_token"

echo 'load test_policy_book immediate'
curl -s -G "http://127.0.0.1:8001/paapi/loadi" --data-urlencode "policyspec=
    policy(test_policy_book,'Project Access', [

        user('jesper'),
        user('ilaman'),

        user_attribute('Writer'),
        user_attribute('Reader'),
        user_attribute('Library'),

        object('hobbit'),
        object('bible'),

        object_attribute('Fantasy'),
        object_attribute('Religious'),
        object_attribute('Books'),

        policy_class('Project Access'),

        connector('PM'),

        assign('jesper','Writer'),
        assign('ilaman','Reader'),
        assign('Writer','Library'),
        assign('Reader','Library'),
        assign('hobbit','Fantasy'),
        assign('bible','Religious'),
        assign('Fantasy','Books'),
        assign('Religious','Books'),
        assign('Library','Project Access'),
        assign('Books','Project Access'),
        assign('Project Access','PM'),

        associate('Writer',[w],'Fantasy'),
        associate('Writer',[w],'Religious'),
        associate('Library',[r],'Books')
    ])." --data-urlencode  "token=admin_token"

echo 'set to test_policy_book'
curl -s -G "http://127.0.0.1:8001/paapi/setpol" --data-urlencode "policy=test_policy_book" --data-urlencode "token=admin_token"

echo 'read the policy (explicitly named as test_policy_book)'
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=test_policy_book" --data-urlencode "token=admin_token"

echo 'set to ipolicy'
curl -s -G "http://127.0.0.1:8001/paapi/setpol" --data-urlencode "policy=ipolicy" --data-urlencode "token=admin_token"

echo 'read the policy (explicitly named as ipolicy)'
curl -s -G "http://127.0.0.1:8001/paapi/readpol" --data-urlencode "policy=ipolicy" --data-urlencode "token=admin_token"