# DB SCHEMA:
#### VALUES TRANSLATED TO [PYTHON](http://initd.org/psycopg/docs/usage.html#passing-parameters-to-sql-queries)  SQL QUERIES

### USERS:
- id  (int)
- username (str)
- password(encrypted) (text)
- email (text)
- profile_image_url (text)
- biography/summary (str)
- created_at (datetime)
- updated_at (datetime)

##### user_auth (Authorization)  _JOIN USERS TABLE?_
- id  (int)
- user_id  (int)  **JOIN USERS**
- administrator (bool)
- moderator (bool)
- professional (bool)
- verified_user (bool)

### POSTS:
- id  (int)
- title (str)
- user_id  (int) **JOIN USERS TABLE**
- user_pose_image_url (text) _JOIN USERS TABLE?_
- description/ Content (str)
- pose_id  (int)  _join to pose table?_
- post_video  (text)
- created_at (datetime)
- updated_at (datetime)

### POST_LIKES:
- id  (int)
- post_id  (int)  **join POSTS**
- user_id  (int)  **join USERS**

### POSE:  _(CORRECT FORM PHOTOS)_
- id  (int)
- pose_image_url (text)
- difficulty (str)
- style (str)
- title (str)
- description (str)

## COMMENTS: **join POSTS**
- id  (int)
- verified (bool)
- comment_text (str)
- comment_image_url (text)
- user_id  (int) **join USERS**
- post_id  (int)  **join POSTS**
- created_at (datetime)
- updated_at (datetime)

### COMMENT_LIKES:     **join COMMENT**
- id  (int)
- comment_id  (int) **join POSTS**
- user_id  (int) **join USERS**

---
