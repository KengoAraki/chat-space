# DB設計

## users table

|    column    |    type    |             options                  |
|:------------:|:----------:|:------------------------------------:|
|     name     |   string   |  index:true, null:false, unique:true |
|     email    |   stirng   |            null:false                |
|   password   |   string   |            null:false                |


### Association

  ・has_many :groups, through :members
  ・has_many :messages
  ・has_many :members


## messages table

|    column    |    type    |             options                  |
|:------------:|:----------:|:------------------------------------:|
|     body     |    text    |                                      |
|    image     |   string   |                                      |
|    group_id  |   integer  |                                      |
|    user_id   |   integer  |                                      |


### Association

  ・belongs_to :group
  ・belongs_to :user



## gropups table

|    column    |    type    |             options                  |
|:------------:|:----------:|:------------------------------------:|
|     name     |   string   |            null:false                |



### Association

  ・has_many :users, through :members
  ・has_many :messages
  ・has_many :memebers


## members table

|    column    |    type    |             options                  |
|:------------:|:----------:|:------------------------------------:|
|    group_id  |   integer  |                                      |
|    user_id   |   integer  |                                      |


### Association

  ・belongs_to :group
  ・belongs_to :user
