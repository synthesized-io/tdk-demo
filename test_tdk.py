import pytest

@pytest.mark.parametrize("table", [
    "address",
    "actor",
    "country",
    "city",
    "store"
])
def test_input_db_isempty(host, table):
    cmd = host.run('docker-compose exec -T input_db bash -c "psql -U postgres -t -c \'SELECT COUNT(*) FROM %s\'"' % table)
    assert int(cmd.stdout) == 0

@pytest.mark.parametrize("table,expected",   [
    ("address",1000),
    ("actor", 1000),
    ("country", 200),
    ("city", 500),
    ("store", 1000)
])
def test_output_db_is_not_empty(host, table, expected):
    cmd = host.run('docker-compose exec -T output_db bash -c "psql -U postgres -t -c \'SELECT COUNT(*) FROM %s\'"' % table)
    assert int(cmd.stdout) == expected
