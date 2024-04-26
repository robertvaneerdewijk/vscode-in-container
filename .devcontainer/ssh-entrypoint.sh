set -xe

if [ -d /tmp/ssh ]
then
    cp /tmp/ssh/*.pub ~/.ssh || true

    cat ~/.ssh/*.pub >> ~/.ssh/authorized_keys

    chmod u+rwx ~/.ssh
    chmod u+rw ~/.ssh*
    chmod a+r ~/.ssh/*.pub
    chmod a+r ~/.ssh/authorized_keys
fi

env | grep "_" | sudo tee -a /etc/environment

exec "$@"