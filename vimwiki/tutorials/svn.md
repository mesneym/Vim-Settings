## What is SVN
Svn is centralized->only one repo and it exist on server side
* Client side software (Eg. Tortoise(SVN))
* server side software (Eg. VisualSVN)


### Admin Activities
1. Create repository for project
2. Create user accounts
3. Provide access permissions for repository
    > Repo url : http://desktop/svn
4. Admin will share repo url with team members along with account details

### Client Activities
1. Get access for SVN repo
2. Install SVN client
3. checkout project source code
4. setup workspace


### SVN Terminology
* Version ID/ Revisision ID(commit ID) 
* Add - New files created should be added(making it eligible for commit)(similar to git)
* Checkout - get code (similar to git)
* Update - update local with latest server side changes(pull)

Before committing
* Check to see if revisision number is same with your local  and then commit
* committing directly is after changes is a bad practice

Eg 
                 file.ext(revisition number 4)
                              |
      Dev1(4)----------------------------------Dev2(4)
        |                                       |
        9:00 am (work started)               9:00(work started)
        |                                       |
        10:am( work completed )              12:00(work completed) 
                                              revisision number of file is still 4 when work
                                              is completed. Dev2 cannot commit directly.
                                              Compare local file with repo file and Take update if 
                                              required and then commit
        
      


### What if two developers try to commit at same time
Get lock-> update-> commit(releases the lock automatically, otherwise you have to manually release the lock otherwise nobody can 
make changes)
  

### Branches
3 separate url for each branch
- trunk(ongoing development) ->Developement team
- branches(SIT & UAT fixes)  ->Bug fixes team 
- tags(Release code base) -> Production team



### Commands
| commands                                                                 | Description                                                                                                  |
| svn up --set-depth infinity *file/folder path*                           | pulls directory                                                                                              |
| svn co --depth=immediates *url*                                          | checkout immediate directory. Not recursive                                                                  |
| svn import -m "New import" *local directory(myproj) repo_url/destination | adds local files to svn repo. destination directory need not exist. svn will recursively create that for you |







