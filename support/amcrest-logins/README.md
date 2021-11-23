# Issue <https://safelyyou.atlassian.net/browse/GR-277>


#Ansible: Check data stream
* * * * * root /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task check_data_stream
#Ansible: Clean up stream files
0 */4 * * * safelyyou /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task cleanup_stream_files
#Ansible: Update network state
*/3 * * * * safelyyou /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task update_network_state
#Ansible: Clean up network
0 0 * * * safelyyou /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task cleanup_network
#Ansible: Setup unit
* * * * * root /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task setup_unit
#Ansible: Update unit state
* * * * * safelyyou /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task update_unit_state
#Ansible: Upload videos
* * * * * safelyyou /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task upload_videos
#Ansible: Upload videos after 30s
* * * * * safelyyou sleep 30; /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py task upload_videos
#Ansible: Upload regular and fast snapshots
* * * * * safelyyou /opt/safely-you/guardian/venv/bin/python /opt/safely-you/guardian/manage.py snapshot
