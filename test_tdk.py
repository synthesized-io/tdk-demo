def test_input_address_isempty(host):
    cmd = host.run('docker-compose exec input_db bash -c "psql -U postgres -t -c \'SELECT COUNT(*) FROM address\'"')
    assert int(cmd.stdout) == 0
  
def test_input_actor_isempty(host):
    cmd = host.run('docker-compose exec input_db bash -c "psql -U postgres -t -c \'SELECT COUNT(*) FROM actor\'"')
    assert int(cmd.stdout) == 0

def test_output_address_is_not_empty(host):
    cmd = host.run('docker-compose exec output_db bash -c "psql -U postgres -t -c \'SELECT COUNT(*) FROM address\'"')
    assert int(cmd.stdout) == 10000
  
def test_output_actor_is_not_empty(host):
    cmd = host.run('docker-compose exec output_db bash -c "psql -U postgres -t -c \'SELECT COUNT(*) FROM actor\'"')
    assert int(cmd.stdout) == 10000
