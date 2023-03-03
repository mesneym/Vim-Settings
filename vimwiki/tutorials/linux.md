# Formatting  
Useful commands 
| command       | description                 |
| lsblk         | list of all block devices   |
| sudo fdisk -l | list of all storage devices |

# Mounting Storage volumes
*mount* command maps the external storage volume to your filesystem. 

For example, 
if an external physical disk with partition *sdb*
*sudo mount /dev/sdb /home/user/data*  -contents of physical disk now show up in /home/user/data

Any folder can be used as a mount point but these are normally used 
* media - This directory is normally for temporary mount points
* mnt - This directory is normally used for mount point that persist

**Useful Commands**
| command                     | description                           |
| mount                       | list of all devices mounted on system |
| mount *device* *mountpoint* | maps a device volume to a mount point |
| umount                      | unmount a device.Opp of mount         |
| df -h                       | storage used on mounted file system   |
