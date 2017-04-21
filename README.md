# DB設計

## users table

|    column    |    type    |             options                  |
|:------------:|:----------:|:------------------------------------:|
|     name     |   string   |            index:true                |


### Association

  ・has_many :groups, through :members  
  ・has_many :messages  
  ・has_many :members


## messages table

|    column    |    type    |             options                  |
|:------------:|:----------:|:------------------------------------:|
|     body     |    text    |                                      |
|    image     |   string   |                                      |
|     group    | references |           foreign_key:true           |
|     user     | references |           foreign_key:true           |


### Association

  ・belongs_to :group  
  ・belongs_to :user



## groups table

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
|     group    | references |           foreign_key:true           |
|     user     | references |           foreign_key:true           |


### Association

  ・belongs_to :group  
  ・belongs_to :user
