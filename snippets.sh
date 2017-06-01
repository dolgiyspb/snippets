grep -e "Collected statistics from cluster" celery_periodic.log | cut -d' ' -f 2 | sed -e 's/,[0-9]*:$//' | python3 -c "import sys,datetime; a=[datetime.datetime.strptime(l.strip(),'%H:%M:%S') for l in sys.stdin.readlines()];print(list(map(lambda n: (n[1] - n[0]).total_seconds(), filter(lambda tp: len(tp) == 2, map(lambda si: a[si:si + 2], range(0, len(a), 2))))));"

timeit.repeat("Datastore.get_datastores('test')", setup="from agent.business.models.ds.datastore import Datastore", repeat=3, number=1)

ssh -N -f -R 8080:10.250.33.27:80 root@10.90.100.103

cd /vagrant/;systemctl stop vstorage-ui-agent;AGENT_CONFIG="/root/dev.cfg" venv/bin/gunicorn --name=vstorage-ui-agent --bind=127.0.0.1:28625 --workers=1 --worker-class=gevent --access-logfile=- --error-logfile=- --log-level=DEBUG wsgi:application
