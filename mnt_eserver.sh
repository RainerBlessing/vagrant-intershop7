#requires the sshfs package
sshfs isas1@localhost:/opt/intershop/eserver1 eserver1 -p 2222 -o nonempty -o transform_symlinks -o follow_symlinks
