   0            RESUME                   0

   1           2 LOAD_CONST               0 (<code object square at 0x5b2878a356c0, file "example.py", line 1>)
               4 MAKE_FUNCTION            0
               6 STORE_NAME               0 (square)

   3           8 NOP

  12          10 LOAD_CONST               1 (0)
              12 LOAD_CONST               2 (None)
              14 IMPORT_NAME              1 (csv)
              16 STORE_NAME               1 (csv)

  13          18 LOAD_CONST               1 (0)
              20 LOAD_CONST               2 (None)
              22 IMPORT_NAME              2 (json)
              24 STORE_NAME               2 (json)

  14          26 LOAD_CONST               1 (0)
              28 LOAD_CONST               2 (None)
              30 IMPORT_NAME              3 (os.path)
              32 STORE_NAME               4 (os)

  15          34 LOAD_CONST               1 (0)
              36 LOAD_CONST               2 (None)
              38 IMPORT_NAME              5 (random)
              40 STORE_NAME               5 (random)

  16          42 LOAD_CONST               1 (0)
              44 LOAD_CONST               2 (None)
              46 IMPORT_NAME              6 (re)
              48 STORE_NAME               6 (re)

  17          50 LOAD_CONST               1 (0)
              52 LOAD_CONST               2 (None)
              54 IMPORT_NAME              7 (sqlite3)
              56 STORE_NAME               7 (sqlite3)

  18          58 LOAD_CONST               1 (0)
              60 LOAD_CONST               2 (None)
              62 IMPORT_NAME              8 (time)
              64 STORE_NAME               8 (time)

  19          66 LOAD_CONST               1 (0)
              68 LOAD_CONST               2 (None)
              70 IMPORT_NAME              9 (pandas)
              72 STORE_NAME              10 (pd)

  20          74 LOAD_CONST               1 (0)
              76 LOAD_CONST               3 (('datetime',))
              78 IMPORT_NAME             11 (datetime)
              80 IMPORT_FROM             11 (datetime)
              82 STORE_NAME              11 (datetime)
              84 POP_TOP

  23          86 PUSH_NULL
              88 LOAD_BUILD_CLASS
              90 LOAD_CONST               4 (<code object SQL at 0x5b2878ac1a30, file "example.py", line 23>)
              92 MAKE_FUNCTION            0
              94 LOAD_CONST               5 ('SQL')
              96 CALL                     2
             104 STORE_NAME              12 (SQL)

 393         106 PUSH_NULL
             108 LOAD_BUILD_CLASS
             110 LOAD_CONST               6 (<code object LOG at 0x5b2878ac6ee0, file "example.py", line 393>)
             112 MAKE_FUNCTION            0
             114 LOAD_CONST               7 ('LOG')
             116 CALL                     2
             124 STORE_NAME              13 (LOG)

 593         126 PUSH_NULL
             128 LOAD_BUILD_CLASS
             130 LOAD_CONST               8 (<code object DATABASE at 0x5b2878a415d0, file "example.py", line 593>)
             132 MAKE_FUNCTION            0
             134 LOAD_CONST               9 ('DATABASE')
             136 CALL                     2
             144 STORE_NAME              14 (DATABASE)

1229         146 LOAD_CONST              10 ('Users.db')
             148 STORE_NAME              15 (db_name)

1230         150 PUSH_NULL
             152 LOAD_NAME               12 (SQL)
             154 LOAD_NAME               15 (db_name)
             156 KW_NAMES                11 (('db_name',))
             158 CALL                     1
             166 STORE_NAME              16 (sql)

1231         168 PUSH_NULL
             170 LOAD_NAME               13 (LOG)
             172 LOAD_CONST              12 ('DataBase.log')
             174 KW_NAMES                13 (('filename',))
             176 CALL                     1
             184 STORE_NAME              17 (log)

1234         186 PUSH_NULL
             188 LOAD_NAME               14 (DATABASE)
             190 CALL                     0
             198 STORE_NAME              18 (db)

1235         200 LOAD_NAME               18 (db)
             202 LOAD_ATTR               39 (NULL|self + api)
             222 CALL                     0
             230 POP_TOP
             232 RETURN_CONST             2 (None)

Disassembly of <code object square at 0x5b2878a356c0, file "example.py", line 1>:
  1           0 RESUME                   0

  2           2 LOAD_FAST                0 (num)
              4 LOAD_FAST                0 (num)
              6 BINARY_OP                5 (*)
             10 RETURN_VALUE

Disassembly of <code object SQL at 0x5b2878ac1a30, file "example.py", line 23>:
 23           0 RESUME                   0
              2 LOAD_NAME                0 (__name__)
              4 STORE_NAME               1 (__module__)
              6 LOAD_CONST               0 ('SQL')
              8 STORE_NAME               2 (__qualname__)

 24          10 LOAD_CONST              17 (('Users.db',))
             12 LOAD_CONST               1 (<code object __init__ at 0x5b2878ab0900, file "example.py", line 24>)
             14 MAKE_FUNCTION            1 (defaults)
             16 STORE_NAME               3 (__init__)

 38          18 LOAD_CONST               2 (<code object __connect at 0x5b2878a7f050, file "example.py", line 38>)
             20 MAKE_FUNCTION            0
             22 STORE_NAME               4 (_SQL__connect)

 53          24 LOAD_CONST               3 (<code object __disconnect at 0x5b2878a7d2f0, file "example.py", line 53>)
             26 MAKE_FUNCTION            0
             28 STORE_NAME               5 (_SQL__disconnect)

 69          30 LOAD_CONST               4 ('name')
             32 LOAD_NAME                6 (str)
             34 LOAD_CONST               5 ('exclusion_titles')
             36 LOAD_NAME                7 (list)
             38 LOAD_NAME                6 (str)
             40 BINARY_SUBSCR
             44 LOAD_CONST               6 ('return')
             46 LOAD_NAME                8 (bool)
             48 LOAD_CONST               7 (None)
             50 BINARY_OP                7 (|)
             54 BUILD_TUPLE              6
             56 LOAD_CONST               8 (<code object __add_exclusion_db at 0x5b2878ac40a0, file "example.py", line 69>)
             58 MAKE_FUNCTION            4 (annotations)
             60 STORE_NAME               9 (_SQL__add_exclusion_db)

129          62 LOAD_CONST               9 (<code object create_db at 0x5b2878a7fa90, file "example.py", line 129>)
             64 MAKE_FUNCTION            0
             66 STORE_NAME              10 (create_db)

159          68 LOAD_CONST               6 ('return')
             70 LOAD_NAME                8 (bool)
             72 BUILD_TUPLE              2
             74 LOAD_CONST              10 (<code object verify_password at 0x5b2878b37230, file "example.py", line 159>)
             76 MAKE_FUNCTION            4 (annotations)
             78 STORE_NAME              11 (verify_password)

201          80 LOAD_CONST               6 ('return')
             82 LOAD_NAME                8 (bool)
             84 BUILD_TUPLE              2
             86 LOAD_CONST              11 (<code object add_db at 0x5b2878988a30, file "example.py", line 201>)
             88 MAKE_FUNCTION            4 (annotations)
             90 STORE_NAME              12 (add_db)

244          92 LOAD_CONST              12 ('username')
             94 LOAD_NAME                6 (str)
             96 LOAD_CONST               6 ('return')
             98 LOAD_NAME                8 (bool)
            100 BUILD_TUPLE              4
            102 LOAD_CONST              13 (<code object remove_user at 0x5b2878a32530, file "example.py", line 244>)
            104 MAKE_FUNCTION            4 (annotations)
            106 STORE_NAME              13 (remove_user)

289         108 LOAD_NAME               14 (staticmethod)

290         110 LOAD_CONST              18 ((None,))
            112 LOAD_CONST               6 ('return')
            114 LOAD_NAME                8 (bool)
            116 BUILD_TUPLE              2
            118 LOAD_CONST              14 (<code object add_exclusion_db at 0x5b2878abfe30, file "example.py", line 289>)
            120 MAKE_FUNCTION            5 (defaults, annotations)

289         122 CALL                     0

290         130 STORE_NAME              15 (add_exclusion_db)

325         132 LOAD_CONST               6 ('return')
            134 LOAD_NAME                7 (list)
            136 LOAD_NAME                6 (str)
            138 BINARY_SUBSCR
            142 LOAD_NAME                8 (bool)
            144 BINARY_OP                7 (|)
            148 BUILD_TUPLE              2
            150 LOAD_CONST              15 (<code object get_excluded_titles at 0x5b287899d890, file "example.py", line 325>)
            152 MAKE_FUNCTION            4 (annotations)
            154 STORE_NAME              16 (get_excluded_titles)

366         156 LOAD_CONST               6 ('return')
            158 LOAD_NAME                8 (bool)
            160 BUILD_TUPLE              2
            162 LOAD_CONST              16 (<code object password_exists at 0x5b2878ac6920, file "example.py", line 366>)
            164 MAKE_FUNCTION            4 (annotations)
            166 STORE_NAME              17 (password_exists)
            168 RETURN_CONST             7 (None)

Disassembly of <code object __init__ at 0x5b2878ab0900, file "example.py", line 24>:
 24           0 RESUME                   0

 32           2 LOAD_FAST                1 (db_name)
              4 LOAD_FAST                0 (self)
              6 STORE_ATTR               0 (db_name)

 35          16 LOAD_CONST               1 (None)
             18 LOAD_FAST                0 (self)
             20 STORE_ATTR               1 (conn)

 36          30 LOAD_CONST               1 (None)
             32 LOAD_FAST                0 (self)
             34 STORE_ATTR               2 (cursor)
             44 RETURN_CONST             1 (None)

Disassembly of <code object __connect at 0x5b2878a7f050, file "example.py", line 38>:
 38           0 RESUME                   0

 46           2 LOAD_FAST                0 (self)
              4 LOAD_ATTR                0 (conn)
             24 POP_JUMP_IF_NOT_NONE    79 (to 184)

 47          26 LOAD_GLOBAL              3 (NULL + print)
             36 LOAD_CONST               2 ('Connecting to SQLite database...')
             38 CALL                     1
             46 POP_TOP

 49          48 LOAD_GLOBAL              5 (NULL + sqlite3)
             58 LOAD_ATTR                6 (connect)
             78 LOAD_FAST                0 (self)
             80 LOAD_ATTR                8 (db_name)
            100 CALL                     1
            108 LOAD_FAST                0 (self)
            110 STORE_ATTR               0 (conn)

 51         120 LOAD_FAST                0 (self)
            122 LOAD_ATTR                0 (conn)
            142 LOAD_ATTR               11 (NULL|self + cursor)
            162 CALL                     0
            170 LOAD_FAST                0 (self)
            172 STORE_ATTR               5 (cursor)
            182 RETURN_CONST             1 (None)

 46     >>  184 RETURN_CONST             1 (None)

Disassembly of <code object __disconnect at 0x5b2878a7d2f0, file "example.py", line 53>:
 53           0 RESUME                   0

 60           2 LOAD_FAST                0 (self)
              4 LOAD_ATTR                0 (conn)
             24 POP_JUMP_IF_FALSE       52 (to 130)

 61          26 LOAD_GLOBAL              3 (NULL + print)
             36 LOAD_CONST               1 ('Disconnecting from SQLite database...')
             38 CALL                     1
             46 POP_TOP

 63          48 LOAD_FAST                0 (self)
             50 LOAD_ATTR                0 (conn)
             70 LOAD_ATTR                5 (NULL|self + close)
             90 CALL                     0
             98 POP_TOP

 65         100 LOAD_CONST               2 (None)
            102 LOAD_FAST                0 (self)
            104 STORE_ATTR               0 (conn)

 67         114 LOAD_CONST               2 (None)
            116 LOAD_FAST                0 (self)
            118 STORE_ATTR               3 (cursor)
            128 RETURN_CONST             2 (None)

 60     >>  130 RETURN_CONST             2 (None)

Disassembly of <code object __add_exclusion_db at 0x5b2878ac40a0, file "example.py", line 69>:
 69           0 RESUME                   0

 80           2 NOP

 81           4 LOAD_FAST                0 (self)
              6 LOAD_ATTR                1 (NULL|self + _SQL__connect)
             26 CALL                     0
             34 POP_TOP

 82          36 NOP

 84          38 LOAD_FAST                0 (self)
             40 LOAD_ATTR                2 (cursor)
             60 LOAD_ATTR                5 (NULL|self + execute)

 85          80 LOAD_CONST               1 ('SELECT titles_to_exclude FROM Users WHERE username=?')

 86          82 LOAD_FAST                1 (name)
             84 BUILD_TUPLE              1

 84          86 CALL                     2
             94 POP_TOP

 88          96 LOAD_FAST                0 (self)
             98 LOAD_ATTR                2 (cursor)
            118 LOAD_ATTR                7 (NULL|self + fetchone)
            138 CALL                     0
            146 STORE_FAST               3 (result)

 91         148 LOAD_FAST                3 (result)
            150 POP_JUMP_IF_NONE         5 (to 162)
            152 LOAD_FAST                3 (result)
            154 LOAD_CONST               3 (0)
            156 BINARY_SUBSCR
            160 POP_JUMP_IF_NOT_NONE     3 (to 168)

 93     >>  162 LOAD_CONST               4 ('PLACEHOLDER')
            164 STORE_FAST               4 (initial_titles)
            166 JUMP_FORWARD             5 (to 178)

 95     >>  168 LOAD_FAST                3 (result)
            170 LOAD_CONST               3 (0)
            172 BINARY_SUBSCR
            176 STORE_FAST               4 (initial_titles)

 98     >>  178 LOAD_FAST                4 (initial_titles)
            180 LOAD_ATTR                9 (NULL|self + strip)
            200 CALL                     0
            208 STORE_FAST               5 (current_titles)

101         210 LOAD_GLOBAL             11 (NULL + set)
            220 LOAD_FAST                5 (current_titles)
            222 LOAD_ATTR               13 (NULL|self + split)
            242 LOAD_CONST               5 (',')
            244 CALL                     1
            252 CALL                     1
            260 STORE_FAST               6 (current_titles_set)

102         262 LOAD_GLOBAL             11 (NULL + set)
            272 LOAD_FAST                2 (exclusion_titles)
            274 CALL                     1
            282 STORE_FAST               7 (titles_set)

105         284 LOAD_FAST                7 (titles_set)
            286 LOAD_FAST                6 (current_titles_set)
            288 BINARY_OP               10 (-)
            292 STORE_FAST               8 (new_titles_set)

108         294 LOAD_FAST                8 (new_titles_set)
            296 POP_JUMP_IF_FALSE      108 (to 514)

110         298 LOAD_CONST               5 (',')
            300 LOAD_ATTR               15 (NULL|self + join)
            320 LOAD_GLOBAL             17 (NULL + list)
            330 LOAD_FAST                8 (new_titles_set)
            332 CALL                     1
            340 CALL                     1
            348 STORE_FAST               9 (updated_titles)

111         350 LOAD_FAST                0 (self)
            352 LOAD_ATTR                2 (cursor)
            372 LOAD_ATTR                5 (NULL|self + execute)

112         392 LOAD_CONST               6 ("UPDATE Users SET titles_to_exclude = COALESCE(titles_to_exclude ||?, '') WHERE username =?")

113         394 LOAD_FAST                9 (updated_titles)
            396 LOAD_FAST                1 (name)
            398 BUILD_TUPLE              2

111         400 CALL                     2
            408 POP_TOP

115         410 LOAD_FAST                0 (self)
            412 LOAD_ATTR               18 (conn)
            432 LOAD_ATTR               21 (NULL|self + commit)
            452 CALL                     0
            460 POP_TOP

116         462 LOAD_GLOBAL             22 (log)
            472 LOAD_ATTR               25 (NULL|self + info)
            492 LOAD_CONST               7 ('Successfully updated titles for user ')
            494 LOAD_FAST                1 (name)
            496 FORMAT_VALUE             0
            498 LOAD_CONST               8 ('.')
            500 BUILD_STRING             3
            502 CALL                     1
            510 POP_TOP

117         512 RETURN_CONST             9 (True)

119     >>  514 LOAD_GLOBAL             22 (log)
            524 LOAD_ATTR               27 (NULL|self + warning)
            544 LOAD_CONST              10 ('No new titles to add for user ')
            546 LOAD_FAST                1 (name)
            548 FORMAT_VALUE             0
            550 LOAD_CONST               8 ('.')
            552 BUILD_STRING             3
            554 CALL                     1
            562 POP_TOP

120         564 RETURN_CONST            11 (False)
        >>  566 PUSH_EXC_INFO

122         568 LOAD_GLOBAL             28 (Exception)
            578 CHECK_EXC_MATCH
            580 POP_JUMP_IF_FALSE       34 (to 650)
            582 STORE_FAST              10 (e)

123         584 LOAD_GLOBAL             22 (log)
            594 LOAD_ATTR               31 (NULL|self + error)
            614 LOAD_CONST              12 ('An error occurred while adding exclusion titles. as ')
            616 LOAD_FAST               10 (e)
            618 FORMAT_VALUE             0
            620 BUILD_STRING             2
            622 CALL                     1
            630 POP_TOP

124         632 POP_EXCEPT
            634 LOAD_CONST               2 (None)
            636 STORE_FAST              10 (e)
            638 DELETE_FAST             10 (e)
            640 RETURN_CONST            11 (False)
        >>  642 LOAD_CONST               2 (None)
            644 STORE_FAST              10 (e)
            646 DELETE_FAST             10 (e)
            648 RERAISE                  1

122     >>  650 RERAISE                  0
        >>  652 COPY                     3
            654 POP_EXCEPT
            656 RERAISE                  1
        >>  658 PUSH_EXC_INFO

125         660 LOAD_GLOBAL             28 (Exception)
            670 CHECK_EXC_MATCH
            672 POP_JUMP_IF_FALSE       34 (to 742)
            674 STORE_FAST              10 (e)

126         676 LOAD_GLOBAL             22 (log)
            686 LOAD_ATTR               31 (NULL|self + error)
            706 LOAD_CONST              12 ('An error occurred while adding exclusion titles. as ')
            708 LOAD_FAST               10 (e)
            710 FORMAT_VALUE             0
            712 BUILD_STRING             2
            714 CALL                     1
            722 POP_TOP

127         724 POP_EXCEPT
            726 LOAD_CONST               2 (None)
            728 STORE_FAST              10 (e)
            730 DELETE_FAST             10 (e)
            732 RETURN_CONST            11 (False)
        >>  734 LOAD_CONST               2 (None)
            736 STORE_FAST              10 (e)
            738 DELETE_FAST             10 (e)
            740 RERAISE                  1

125     >>  742 RERAISE                  0
        >>  744 COPY                     3
            746 POP_EXCEPT
            748 RERAISE                  1
ExceptionTable:
  4 to 34 -> 658 [0]
  38 to 510 -> 566 [0]
  514 to 562 -> 566 [0]
  566 to 582 -> 652 [1] lasti
  584 to 630 -> 642 [1] lasti
  632 to 638 -> 658 [0]
  642 to 650 -> 652 [1] lasti
  652 to 656 -> 658 [0]
  658 to 674 -> 744 [1] lasti
  676 to 722 -> 734 [1] lasti
  734 to 742 -> 744 [1] lasti

Disassembly of <code object create_db at 0x5b2878a7fa90, file "example.py", line 129>:
129           0 RESUME                   0

136           2 LOAD_GLOBAL              1 (NULL + print)
             12 LOAD_CONST               1 ('Creating initial database schema...')
             14 CALL                     1
             22 POP_TOP

138          24 LOAD_GLOBAL              3 (NULL + sqlite3)
             34 LOAD_ATTR                4 (connect)
             54 LOAD_FAST                0 (self)
             56 LOAD_ATTR                6 (db_name)
             76 CALL                     1
             84 STORE_FAST               1 (conn)

140          86 LOAD_FAST                1 (conn)
             88 LOAD_ATTR                9 (NULL|self + cursor)
            108 CALL                     0
            116 STORE_FAST               2 (cursor)

143         118 LOAD_FAST                2 (cursor)
            120 LOAD_ATTR               11 (NULL|self + execute)
            140 LOAD_CONST               2 ('DROP TABLE IF EXISTS Users;')
            142 CALL                     1
            150 POP_TOP

146         152 LOAD_FAST                2 (cursor)
            154 LOAD_ATTR               11 (NULL|self + execute)

147         174 LOAD_CONST               3 ('CREATE TABLE Users (\n                            id INTEGER PRIMARY KEY,\n                            username TEXT NOT NULL UNIQUE,\n                            password TEXT NOT NULL,\n                            titles_to_exclude TEXT);')

146         176 CALL                     1
            184 POP_TOP

155         186 LOAD_FAST                1 (conn)
            188 LOAD_ATTR               13 (NULL|self + commit)
            208 CALL                     0
            216 POP_TOP

157         218 LOAD_FAST                1 (conn)
            220 LOAD_ATTR               15 (NULL|self + close)
            240 CALL                     0
            248 POP_TOP
            250 RETURN_CONST             4 (None)

Disassembly of <code object verify_password at 0x5b2878b37230, file "example.py", line 159>:
159           0 RESUME                   0

167           2 NOP

168           4 LOAD_GLOBAL              1 (NULL + print)
             14 LOAD_CONST               1 ('Verifying password of ')
             16 LOAD_FAST                1 (username)
             18 FORMAT_VALUE             0
             20 BUILD_STRING             2
             22 CALL                     1
             30 POP_TOP

170          32 LOAD_FAST                0 (self)
             34 LOAD_ATTR                3 (NULL|self + _SQL__connect)
             54 CALL                     0
             62 POP_TOP

173          64 LOAD_FAST                0 (self)
             66 LOAD_ATTR                4 (cursor)
             86 LOAD_ATTR                7 (NULL|self + execute)

174         106 LOAD_CONST               2 ('SELECT password FROM Users WHERE username=?')
            108 LOAD_FAST                1 (username)
            110 BUILD_TUPLE              1

173         112 CALL                     2
            120 POP_TOP

178         122 LOAD_FAST                0 (self)
            124 LOAD_ATTR                4 (cursor)
            144 LOAD_ATTR                9 (NULL|self + fetchone)
            164 CALL                     0
            172 STORE_FAST               3 (result)

181         174 LOAD_FAST                0 (self)
            176 LOAD_ATTR               11 (NULL|self + _SQL__disconnect)
            196 CALL                     0
            204 POP_TOP

184         206 LOAD_FAST                3 (result)
            208 POP_JUMP_IF_FALSE       11 (to 232)

186         210 LOAD_FAST                3 (result)
            212 LOAD_CONST               3 (0)
            214 BINARY_SUBSCR
            218 STORE_FAST               4 (stored_password)

189         220 LOAD_FAST                2 (password)
            222 LOAD_FAST                4 (stored_password)
            224 COMPARE_OP              40 (==)
            228 POP_JUMP_IF_FALSE        1 (to 232)

191         230 RETURN_CONST             4 (True)

194     >>  232 RETURN_CONST             5 (False)
        >>  234 PUSH_EXC_INFO

195         236 LOAD_GLOBAL             12 (Exception)
            246 CHECK_EXC_MATCH
            248 POP_JUMP_IF_FALSE       34 (to 318)
            250 STORE_FAST               5 (e)

197         252 LOAD_GLOBAL             14 (log)
            262 LOAD_ATTR               17 (NULL|self + info)
            282 LOAD_CONST               6 ('An error occurred while verifying the password. as ')
            284 LOAD_FAST                5 (e)
            286 FORMAT_VALUE             0
            288 BUILD_STRING             2
            290 CALL                     1
            298 POP_TOP

199         300 POP_EXCEPT
            302 LOAD_CONST               7 (None)
            304 STORE_FAST               5 (e)
            306 DELETE_FAST              5 (e)
            308 RETURN_CONST             5 (False)
        >>  310 LOAD_CONST               7 (None)
            312 STORE_FAST               5 (e)
            314 DELETE_FAST              5 (e)
            316 RERAISE                  1

195     >>  318 RERAISE                  0
        >>  320 COPY                     3
            322 POP_EXCEPT
            324 RERAISE                  1
ExceptionTable:
  4 to 228 -> 234 [0]
  234 to 250 -> 320 [1] lasti
  252 to 298 -> 310 [1] lasti
  310 to 318 -> 320 [1] lasti

Disassembly of <code object add_db at 0x5b2878988a30, file "example.py", line 201>:
201           0 RESUME                   0

210           2 NOP

211           4 LOAD_GLOBAL              1 (NULL + print)
             14 LOAD_CONST               1 ('Creating database entry for ')
             16 LOAD_FAST                1 (username)
             18 FORMAT_VALUE             0
             20 BUILD_STRING             2
             22 CALL                     1
             30 POP_TOP

213          32 LOAD_FAST                0 (self)
             34 LOAD_ATTR                3 (NULL|self + _SQL__connect)
             54 CALL                     0
             62 POP_TOP

216          64 LOAD_FAST                0 (self)
             66 LOAD_ATTR                4 (cursor)
             86 LOAD_ATTR                7 (NULL|self + execute)
            106 LOAD_CONST               2 ('SELECT * FROM users WHERE username=?')
            108 LOAD_FAST                1 (username)
            110 BUILD_TUPLE              1
            112 CALL                     2
            120 POP_TOP

217         122 LOAD_FAST                0 (self)
            124 LOAD_ATTR                4 (cursor)
            144 LOAD_ATTR                9 (NULL|self + fetchone)
            164 CALL                     0
            172 STORE_FAST               4 (existing_user)

218         174 LOAD_FAST                0 (self)
            176 LOAD_ATTR               11 (NULL|self + _SQL__disconnect)
            196 CALL                     0
            204 POP_TOP

221         206 LOAD_FAST                4 (existing_user)
            208 POP_JUMP_IF_FALSE       25 (to 260)

222         210 LOAD_GLOBAL             12 (log)
            220 LOAD_ATTR               15 (NULL|self + warning)
            240 LOAD_CONST               3 ('Username already exists: ')
            242 LOAD_FAST                1 (username)
            244 FORMAT_VALUE             0
            246 BUILD_STRING             2
            248 CALL                     1
            256 POP_TOP

223         258 RETURN_CONST             4 (False)

226     >>  260 LOAD_FAST                0 (self)
            262 LOAD_ATTR                3 (NULL|self + _SQL__connect)
            282 CALL                     0
            290 POP_TOP

227         292 LOAD_FAST                0 (self)
            294 LOAD_ATTR                4 (cursor)
            314 LOAD_ATTR                7 (NULL|self + execute)

228         334 LOAD_CONST               5 ('INSERT INTO users (username, password) VALUES (?,?)')

229         336 LOAD_FAST                1 (username)
            338 LOAD_FAST                3 (password)
            340 BUILD_TUPLE              2

227         342 CALL                     2
            350 POP_TOP

231         352 LOAD_FAST                0 (self)
            354 LOAD_ATTR               16 (conn)
            374 LOAD_ATTR               19 (NULL|self + commit)
            394 CALL                     0
            402 POP_TOP

232         404 LOAD_FAST                0 (self)
            406 LOAD_ATTR               11 (NULL|self + _SQL__disconnect)
            426 CALL                     0
            434 POP_TOP

235         436 LOAD_GLOBAL             20 (sql)
            446 LOAD_ATTR               23 (NULL|self + add_exclusion_db)
            466 LOAD_FAST                1 (username)
            468 LOAD_FAST                2 (exclusion_titles)
            470 LOAD_CONST               6 ('CDB')
            472 CALL                     3
            480 POP_TOP

237         482 LOAD_GLOBAL             12 (log)
            492 LOAD_ATTR               25 (NULL|self + info)
            512 LOAD_CONST               7 ('Password Successfully Made')
            514 CALL                     1
            522 POP_TOP

238         524 RETURN_CONST             8 (True)
        >>  526 PUSH_EXC_INFO

239         528 LOAD_GLOBAL             26 (Exception)
            538 CHECK_EXC_MATCH
            540 POP_JUMP_IF_FALSE       34 (to 610)
            542 STORE_FAST               5 (e)

241         544 LOAD_GLOBAL             12 (log)
            554 LOAD_ATTR               29 (NULL|self + error)
            574 LOAD_CONST               9 ('An error occurred while creating the database entry. as ')
            576 LOAD_FAST                5 (e)
            578 FORMAT_VALUE             0
            580 BUILD_STRING             2
            582 CALL                     1
            590 POP_TOP

242         592 POP_EXCEPT
            594 LOAD_CONST              10 (None)
            596 STORE_FAST               5 (e)
            598 DELETE_FAST              5 (e)
            600 RETURN_CONST             4 (False)
        >>  602 LOAD_CONST              10 (None)
            604 STORE_FAST               5 (e)
            606 DELETE_FAST              5 (e)
            608 RERAISE                  1

239     >>  610 RERAISE                  0
        >>  612 COPY                     3
            614 POP_EXCEPT
            616 RERAISE                  1
ExceptionTable:
  4 to 256 -> 526 [0]
  260 to 522 -> 526 [0]
  526 to 542 -> 612 [1] lasti
  544 to 590 -> 602 [1] lasti
  602 to 610 -> 612 [1] lasti

Disassembly of <code object remove_user at 0x5b2878a32530, file "example.py", line 244>:
244           0 RESUME                   0

254           2 NOP

255           4 LOAD_GLOBAL              1 (NULL + print)
             14 LOAD_CONST               1 ('Removing data for ')
             16 LOAD_FAST                1 (username)
             18 FORMAT_VALUE             0
             20 BUILD_STRING             2
             22 CALL                     1
             30 POP_TOP

257          32 LOAD_FAST                0 (self)
             34 LOAD_ATTR                3 (NULL|self + _SQL__connect)
             54 CALL                     0
             62 POP_TOP

260          64 LOAD_FAST                0 (self)
             66 LOAD_ATTR                4 (cursor)
             86 LOAD_ATTR                7 (NULL|self + execute)
            106 LOAD_CONST               2 ('SELECT * FROM Users WHERE username=?')
            108 LOAD_FAST                1 (username)
            110 BUILD_TUPLE              1
            112 CALL                     2
            120 POP_TOP

261         122 LOAD_FAST                0 (self)
            124 LOAD_ATTR                4 (cursor)
            144 LOAD_ATTR                9 (NULL|self + fetchone)
            164 CALL                     0
            172 STORE_FAST               2 (user_exists)

264         174 LOAD_FAST                0 (self)
            176 LOAD_ATTR               11 (NULL|self + _SQL__disconnect)
            196 CALL                     0
            204 POP_TOP

266         206 LOAD_FAST                2 (user_exists)
            208 POP_JUMP_IF_TRUE        25 (to 260)

268         210 LOAD_GLOBAL             12 (log)
            220 LOAD_ATTR               15 (NULL|self + warning)
            240 LOAD_CONST               3 ('User does not exist: ')
            242 LOAD_FAST                1 (username)
            244 FORMAT_VALUE             0
            246 BUILD_STRING             2
            248 CALL                     1
            256 POP_TOP

269         258 RETURN_CONST             4 (False)

272     >>  260 LOAD_FAST                0 (self)
            262 LOAD_ATTR                3 (NULL|self + _SQL__connect)
            282 CALL                     0
            290 POP_TOP

275         292 LOAD_FAST                0 (self)
            294 LOAD_ATTR                4 (cursor)
            314 LOAD_ATTR                7 (NULL|self + execute)
            334 LOAD_CONST               5 ('DELETE FROM Users WHERE username=?')
            336 LOAD_FAST                1 (username)
            338 BUILD_TUPLE              1
            340 CALL                     2
            348 POP_TOP

276         350 LOAD_FAST                0 (self)
            352 LOAD_ATTR               16 (conn)
            372 LOAD_ATTR               19 (NULL|self + commit)
            392 CALL                     0
            400 POP_TOP

279         402 LOAD_FAST                0 (self)
            404 LOAD_ATTR               11 (NULL|self + _SQL__disconnect)
            424 CALL                     0
            432 POP_TOP

282         434 LOAD_GLOBAL             12 (log)
            444 LOAD_ATTR               21 (NULL|self + info)
            464 LOAD_CONST               6 ('Successfully removed data for ')
            466 LOAD_FAST                1 (username)
            468 FORMAT_VALUE             0
            470 BUILD_STRING             2
            472 CALL                     1
            480 POP_TOP

283         482 RETURN_CONST             7 (True)
        >>  484 PUSH_EXC_INFO

284         486 LOAD_GLOBAL             22 (Exception)
            496 CHECK_EXC_MATCH
            498 POP_JUMP_IF_FALSE       34 (to 568)
            500 STORE_FAST               3 (e)

286         502 LOAD_GLOBAL             12 (log)
            512 LOAD_ATTR               25 (NULL|self + error)
            532 LOAD_CONST               8 ('An error occurred while removing the database entry. as ')
            534 LOAD_FAST                3 (e)
            536 FORMAT_VALUE             0
            538 BUILD_STRING             2
            540 CALL                     1
            548 POP_TOP

287         550 POP_EXCEPT
            552 LOAD_CONST               9 (None)
            554 STORE_FAST               3 (e)
            556 DELETE_FAST              3 (e)
            558 RETURN_CONST             4 (False)
        >>  560 LOAD_CONST               9 (None)
            562 STORE_FAST               3 (e)
            564 DELETE_FAST              3 (e)
            566 RERAISE                  1

284     >>  568 RERAISE                  0
        >>  570 COPY                     3
            572 POP_EXCEPT
            574 RERAISE                  1
ExceptionTable:
  4 to 256 -> 484 [0]
  260 to 480 -> 484 [0]
  484 to 500 -> 570 [1] lasti
  502 to 548 -> 560 [1] lasti
  560 to 568 -> 570 [1] lasti

Disassembly of <code object add_exclusion_db at 0x5b2878abfe30, file "example.py", line 289>:
289           0 RESUME                   0

299           2 LOAD_GLOBAL              1 (NULL + print)
             12 LOAD_CONST               1 ('Adding exclusion titles for ')
             14 LOAD_FAST                0 (name)
             16 FORMAT_VALUE             0
             18 BUILD_STRING             2
             20 CALL                     1
             28 POP_TOP

300          30 NOP

303          32 LOAD_GLOBAL              2 (sql)
             42 LOAD_ATTR                5 (NULL|self + _SQL__add_exclusion_db)
             62 LOAD_FAST                0 (name)
             64 LOAD_FAST                1 (exclusion_titles)
             66 CALL                     2
             74 STORE_FAST               3 (value)

306          76 LOAD_FAST                3 (value)
             78 LOAD_CONST               2 (False)
             80 IS_OP                    0
             82 POP_JUMP_IF_FALSE        1 (to 86)

307          84 RETURN_CONST             2 (False)

310     >>   86 LOAD_FAST                2 (special)
             88 POP_JUMP_IF_TRUE        28 (to 146)

312          90 LOAD_GLOBAL              2 (sql)
            100 LOAD_ATTR                5 (NULL|self + _SQL__add_exclusion_db)
            120 LOAD_FAST                0 (name)
            122 LOAD_CONST               3 (',')
            124 BUILD_LIST               1
            126 CALL                     2
            134 STORE_FAST               4 (msg)

314         136 LOAD_FAST                4 (msg)
            138 LOAD_CONST               2 (False)
            140 IS_OP                    0
            142 POP_JUMP_IF_FALSE        1 (to 146)

315         144 RETURN_CONST             2 (False)

318     >>  146 LOAD_FAST                3 (value)
            148 RETURN_VALUE
        >>  150 PUSH_EXC_INFO

320         152 LOAD_GLOBAL              6 (Exception)
            162 CHECK_EXC_MATCH
            164 POP_JUMP_IF_FALSE       34 (to 234)
            166 STORE_FAST               5 (e)

322         168 LOAD_GLOBAL              8 (log)
            178 LOAD_ATTR               11 (NULL|self + error)
            198 LOAD_CONST               4 ('An error occurred while adding exclusion titles. as ')
            200 LOAD_FAST                5 (e)
            202 FORMAT_VALUE             0
            204 BUILD_STRING             2
            206 CALL                     1
            214 POP_TOP

323         216 POP_EXCEPT
            218 LOAD_CONST               5 (None)
            220 STORE_FAST               5 (e)
            222 DELETE_FAST              5 (e)
            224 RETURN_CONST             2 (False)
        >>  226 LOAD_CONST               5 (None)
            228 STORE_FAST               5 (e)
            230 DELETE_FAST              5 (e)
            232 RERAISE                  1

320     >>  234 RERAISE                  0
        >>  236 COPY                     3
            238 POP_EXCEPT
            240 RERAISE                  1
ExceptionTable:
  32 to 82 -> 150 [0]
  86 to 142 -> 150 [0]
  146 to 146 -> 150 [0]
  150 to 166 -> 236 [1] lasti
  168 to 214 -> 226 [1] lasti
  226 to 234 -> 236 [1] lasti

Disassembly of <code object get_excluded_titles at 0x5b287899d890, file "example.py", line 325>:
325           0 RESUME                   0

332           2 NOP

333           4 LOAD_GLOBAL              1 (NULL + print)
             14 LOAD_CONST               1 ('Retrieving excluded titles for ')
             16 LOAD_FAST                1 (username)
             18 FORMAT_VALUE             0
             20 BUILD_STRING             2
             22 CALL                     1
             30 POP_TOP

335          32 LOAD_FAST                0 (self)
             34 LOAD_ATTR                3 (NULL|self + _SQL__connect)
             54 CALL                     0
             62 POP_TOP

338          64 LOAD_FAST                0 (self)
             66 LOAD_ATTR                4 (cursor)
             86 LOAD_ATTR                7 (NULL|self + execute)

339         106 LOAD_CONST               2 ('SELECT titles_to_exclude FROM Users WHERE username=?')
            108 LOAD_FAST                1 (username)
            110 BUILD_TUPLE              1

338         112 CALL                     2
            120 POP_TOP

343         122 LOAD_FAST                0 (self)
            124 LOAD_ATTR                4 (cursor)
            144 LOAD_ATTR                9 (NULL|self + fetchone)
            164 CALL                     0
            172 STORE_FAST               2 (result)

346         174 LOAD_FAST                0 (self)
            176 LOAD_ATTR               11 (NULL|self + _SQL__disconnect)
            196 CALL                     0
            204 POP_TOP

349         206 LOAD_FAST                2 (result)
            208 POP_JUMP_IF_FALSE       51 (to 312)

351         210 LOAD_FAST                2 (result)
            212 LOAD_CONST               3 (0)
            214 BINARY_SUBSCR
            218 LOAD_ATTR               13 (NULL|self + split)
            238 LOAD_CONST               4 (',')
            240 CALL                     1
            248 STORE_FAST               3 (titles_list)

354         250 LOAD_FAST                3 (titles_list)
            252 GET_ITER
            254 LOAD_FAST_AND_CLEAR      4 (title)
            256 SWAP                     2
            258 BUILD_LIST               0
            260 SWAP                     2
        >>  262 FOR_ITER                18 (to 302)
            266 STORE_FAST               4 (title)
            268 LOAD_FAST                4 (title)
            270 LOAD_ATTR               15 (NULL|self + strip)
            290 CALL                     0
            298 LIST_APPEND              2
            300 JUMP_BACKWARD           20 (to 262)
        >>  302 END_FOR
            304 STORE_FAST               5 (titles_to_exclude)
            306 STORE_FAST               4 (title)

360         308 LOAD_FAST                5 (titles_to_exclude)
            310 RETURN_VALUE

357     >>  312 BUILD_LIST               0
            314 STORE_FAST               5 (titles_to_exclude)

360         316 LOAD_FAST                5 (titles_to_exclude)
            318 RETURN_VALUE
        >>  320 SWAP                     2
            322 POP_TOP

354         324 SWAP                     2
            326 STORE_FAST               4 (title)
            328 RERAISE                  0
        >>  330 PUSH_EXC_INFO

361         332 LOAD_GLOBAL             16 (Exception)
            342 CHECK_EXC_MATCH
            344 POP_JUMP_IF_FALSE       34 (to 414)
            346 STORE_FAST               6 (e)

363         348 LOAD_GLOBAL             18 (log)
            358 LOAD_ATTR               21 (NULL|self + error)
            378 LOAD_CONST               5 ('An error occurred while retrieving excluded titles. as ')
            380 LOAD_FAST                6 (e)
            382 FORMAT_VALUE             0
            384 BUILD_STRING             2
            386 CALL                     1
            394 POP_TOP

364         396 POP_EXCEPT
            398 LOAD_CONST               6 (None)
            400 STORE_FAST               6 (e)
            402 DELETE_FAST              6 (e)
            404 RETURN_CONST             7 (False)
        >>  406 LOAD_CONST               6 (None)
            408 STORE_FAST               6 (e)
            410 DELETE_FAST              6 (e)
            412 RERAISE                  1

361     >>  414 RERAISE                  0
        >>  416 COPY                     3
            418 POP_EXCEPT
            420 RERAISE                  1
ExceptionTable:
  4 to 256 -> 330 [0]
  258 to 302 -> 320 [2]
  304 to 308 -> 330 [0]
  312 to 316 -> 330 [0]
  320 to 328 -> 330 [0]
  330 to 346 -> 416 [1] lasti
  348 to 394 -> 406 [1] lasti
  406 to 414 -> 416 [1] lasti

Disassembly of <code object password_exists at 0x5b2878ac6920, file "example.py", line 366>:
366           0 RESUME                   0

377           2 LOAD_FAST                0 (self)
              4 LOAD_ATTR                1 (NULL|self + _SQL__connect)
             24 CALL                     0
             32 POP_TOP

380          34 LOAD_CONST               1 ('SELECT COUNT(*) FROM Users WHERE password = ?')
             36 STORE_FAST               2 (query)

381          38 LOAD_FAST                0 (self)
             40 LOAD_ATTR                2 (cursor)
             60 LOAD_ATTR                5 (NULL|self + execute)
             80 LOAD_FAST                2 (query)
             82 LOAD_FAST                1 (password)
             84 BUILD_TUPLE              1
             86 CALL                     2
             94 POP_TOP

384          96 LOAD_FAST                0 (self)
             98 LOAD_ATTR                2 (cursor)
            118 LOAD_ATTR                7 (NULL|self + fetchone)
            138 CALL                     0
            146 LOAD_CONST               2 (0)
            148 BINARY_SUBSCR
            152 STORE_FAST               3 (count)

387         154 LOAD_FAST                0 (self)
            156 LOAD_ATTR                9 (NULL|self + _SQL__disconnect)
            176 CALL                     0
            184 POP_TOP

390         186 LOAD_FAST                3 (count)
            188 LOAD_CONST               2 (0)
            190 COMPARE_OP              68 (>)
            194 RETURN_VALUE

Disassembly of <code object LOG at 0x5b2878ac6ee0, file "example.py", line 393>:
393           0 RESUME                   0
              2 LOAD_NAME                0 (__name__)
              4 STORE_NAME               1 (__module__)
              6 LOAD_CONST               0 ('LOG')
              8 STORE_NAME               2 (__qualname__)

396          10 NOP

397          12 NOP

398          14 NOP

399          16 NOP

400          18 NOP

401          20 NOP

402          22 NOP

403          24 NOP

404          26 NOP

394          28 LOAD_CONST              11 (('Server.log', True, False, 'cyan', 'green', 'yellow', 'red', 'red', '%(log_color)s%(levelname)-8s%(reset)s %(blue)s%(message)s'))
             30 LOAD_CONST               1 (<code object __init__ at 0x5b28789a0a40, file "example.py", line 394>)
             32 MAKE_FUNCTION            1 (defaults)
             34 STORE_NAME               3 (__init__)

474          36 LOAD_NAME                4 (staticmethod)

475          38 LOAD_CONST               2 ('return')
             40 LOAD_NAME                5 (str)
             42 BUILD_TUPLE              2
             44 LOAD_CONST               3 (<code object __timestamp at 0x5b2878ac7420, file "example.py", line 474>)
             46 MAKE_FUNCTION            4 (annotations)

474          48 CALL                     0

475          56 STORE_NAME               6 (_LOG__timestamp)

486          58 LOAD_CONST               4 (<code object __only at 0x5b2878ac25f0, file "example.py", line 486>)
             60 MAKE_FUNCTION            0
             62 STORE_NAME               7 (_LOG__only)

499          64 LOAD_NAME                4 (staticmethod)

500          66 LOAD_CONST               5 (<code object __pad_message at 0x5b2878a7e230, file "example.py", line 499>)
             68 MAKE_FUNCTION            0

499          70 CALL                     0

500          78 STORE_NAME               8 (_LOG__pad_message)

524          80 LOAD_CONST               6 (<code object info at 0x5b2878ac27e0, file "example.py", line 524>)
             82 MAKE_FUNCTION            0
             84 STORE_NAME               9 (info)

541          86 LOAD_CONST               7 (<code object warning at 0x5b2878a43a50, file "example.py", line 541>)
             88 MAKE_FUNCTION            0
             90 STORE_NAME              10 (warning)

558          92 LOAD_CONST               8 (<code object error at 0x5b2878a6e140, file "example.py", line 558>)
             94 MAKE_FUNCTION            0
             96 STORE_NAME              11 (error)

575          98 LOAD_CONST               9 (<code object critical at 0x5b2878a6d630, file "example.py", line 575>)
            100 MAKE_FUNCTION            0
            102 STORE_NAME              12 (critical)
            104 RETURN_CONST            10 (None)

Disassembly of <code object __init__ at 0x5b28789a0a40, file "example.py", line 394>:
394           0 RESUME                   0

434           2 LOAD_FAST                2 (use_print)
              4 LOAD_FAST                0 (self)
              6 STORE_ATTR               0 (color)

435          16 LOAD_FAST                0 (self)
             18 LOAD_ATTR                0 (color)
             38 POP_JUMP_IF_FALSE      130 (to 300)

437          40 LOAD_FAST_CHECK         10 (print)
             42 LOAD_ATTR                3 (NULL|self + getprint)
             62 CALL                     0
             70 STORE_FAST              10 (print)

438          72 LOAD_FAST                3 (DEBUG)
             74 POP_JUMP_IF_FALSE       18 (to 112)

439          76 LOAD_FAST               10 (print)
             78 LOAD_ATTR                5 (NULL|self + setLevel)

440          98 LOAD_FAST               10 (print)

439         100 CALL                     1
            108 POP_TOP
            110 JUMP_FORWARD            17 (to 146)

443     >>  112 LOAD_FAST               10 (print)
            114 LOAD_ATTR                5 (NULL|self + setLevel)

444         134 LOAD_FAST               10 (print)

443         136 CALL                     1
            144 POP_TOP

446     >>  146 LOAD_FAST               10 (print)
            148 LOAD_ATTR                7 (NULL|self + StreamHandler)
            168 CALL                     0
            176 STORE_FAST              11 (handler)

447         178 LOAD_FAST               10 (print)
            180 LOAD_ATTR                9 (NULL|self + ColoredFormatter)

448         200 LOAD_FAST                9 (print_fmt_parameters)

449         202 LOAD_CONST               1 (None)

450         204 LOAD_CONST               2 (True)

452         206 LOAD_FAST                4 (debug_color)

453         208 LOAD_FAST                5 (info_color)

454         210 LOAD_FAST                6 (warning_color)

455         212 LOAD_FAST                7 (error_color)

456         214 LOAD_FAST                8 (critical_color)

451         216 LOAD_CONST               3 (('DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL'))
            218 BUILD_CONST_KEY_MAP      5

447         220 KW_NAMES                 4 (('datefmt', 'reset', 'log_colors'))
            222 CALL                     4
            230 STORE_FAST              12 (formatter)

459         232 LOAD_FAST               11 (handler)
            234 LOAD_ATTR               11 (NULL|self + setFormatter)
            254 LOAD_FAST               12 (formatter)
            256 CALL                     1
            264 POP_TOP

460         266 LOAD_FAST               10 (print)
            268 LOAD_ATTR               13 (NULL|self + addHandler)
            288 LOAD_FAST               11 (handler)
            290 CALL                     1
            298 POP_TOP

462     >>  300 LOAD_GLOBAL             15 (NULL + str)
            310 LOAD_FAST                1 (filename)
            312 CALL                     1
            320 LOAD_FAST                0 (self)
            322 STORE_ATTR               8 (filename)

463         332 LOAD_GLOBAL             18 (os)
            342 LOAD_ATTR               20 (path)
            362 LOAD_ATTR               23 (NULL|self + exists)
            382 LOAD_FAST                0 (self)
            384 LOAD_ATTR               16 (filename)
            404 CALL                     1
            412 POP_JUMP_IF_TRUE        34 (to 482)

464         414 LOAD_FAST                0 (self)
            416 LOAD_ATTR               25 (NULL|self + _LOG__only)
            436 LOAD_CONST               5 ('|-------------------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|')
            438 CALL                     1
            446 POP_TOP

465         448 LOAD_FAST                0 (self)
            450 LOAD_ATTR               25 (NULL|self + _LOG__only)

466         470 LOAD_CONST               6 ('|     Timestamp     |  LOG Level  |                                                                       LOG Messages                                                                       |')

465         472 CALL                     1
            480 POP_TOP

472     >>  482 LOAD_FAST                0 (self)
            484 LOAD_ATTR               25 (NULL|self + _LOG__only)
            504 LOAD_CONST               5 ('|-------------------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|')
            506 CALL                     1
            514 POP_TOP
            516 RETURN_CONST             1 (None)

Disassembly of <code object __timestamp at 0x5b2878ac7420, file "example.py", line 474>:
474           0 RESUME                   0

482           2 LOAD_GLOBAL              1 (NULL + datetime)
             12 LOAD_ATTR                2 (now)
             32 CALL                     0
             40 STORE_FAST               0 (now)

483          42 LOAD_FAST                0 (now)
             44 LOAD_ATTR                5 (NULL|self + strftime)
             64 LOAD_CONST               1 ('%Y-%m-%d %H:%M:%S')
             66 CALL                     1
             74 FORMAT_VALUE             0
             76 STORE_FAST               1 (time)

484          78 PUSH_NULL
             80 LOAD_FAST                1 (time)
             82 LOAD_ATTR                6 (encode)
            102 LOAD_CONST               2 ('utf-8')
            104 CALL                     1
            112 LOAD_ATTR                9 (NULL|self + decode)
            132 LOAD_CONST               2 ('utf-8')
            134 CALL                     1
            142 RETURN_VALUE

Disassembly of <code object __only at 0x5b2878ac25f0, file "example.py", line 486>:
486           0 RESUME                   0

496           2 LOAD_GLOBAL              1 (NULL + open)
             12 LOAD_FAST                0 (self)
             14 LOAD_ATTR                2 (filename)
             34 LOAD_CONST               1 ('a')
             36 CALL                     2
             44 BEFORE_WITH
             46 STORE_FAST               2 (f)

497          48 LOAD_FAST                2 (f)
             50 LOAD_ATTR                5 (NULL|self + write)
             70 LOAD_GLOBAL              7 (NULL + str)
             80 LOAD_FAST                1 (message)
             82 CALL                     1
             90 FORMAT_VALUE             0
             92 LOAD_CONST               2 ('\n')
             94 BUILD_STRING             2
             96 CALL                     1
            104 POP_TOP

496         106 LOAD_CONST               3 (None)
            108 LOAD_CONST               3 (None)
            110 LOAD_CONST               3 (None)
            112 CALL                     2
            120 POP_TOP
            122 RETURN_CONST             3 (None)
        >>  124 PUSH_EXC_INFO
            126 WITH_EXCEPT_START
            128 POP_JUMP_IF_TRUE         1 (to 132)
            130 RERAISE                  2
        >>  132 POP_TOP
            134 POP_EXCEPT
            136 POP_TOP
            138 POP_TOP
            140 RETURN_CONST             3 (None)
        >>  142 COPY                     3
            144 POP_EXCEPT
            146 RERAISE                  1
ExceptionTable:
  46 to 104 -> 124 [1] lasti
  124 to 132 -> 142 [3] lasti

Disassembly of <code object __pad_message at 0x5b2878a7e230, file "example.py", line 499>:
499           0 RESUME                   0

511           2 LOAD_CONST               1 (153)
              4 LOAD_GLOBAL              1 (NULL + len)
             14 LOAD_FAST                0 (message)
             16 CALL                     1
             24 BINARY_OP               10 (-)
             28 STORE_FAST               1 (num_spaces)

513          30 LOAD_FAST                1 (num_spaces)
             32 LOAD_CONST               2 (0)
             34 COMPARE_OP              68 (>)
             38 POP_JUMP_IF_FALSE        9 (to 58)

515          40 LOAD_FAST                0 (message)
             42 LOAD_CONST               3 (' ')
             44 LOAD_FAST                1 (num_spaces)
             46 BINARY_OP                5 (*)
             50 BINARY_OP                0 (+)
             54 STORE_FAST               2 (padded_message)
             56 JUMP_FORWARD            10 (to 78)

518     >>   58 LOAD_FAST                0 (message)
             60 LOAD_CONST               4 (None)
             62 LOAD_CONST               5 (150)
             64 BINARY_SLICE
             66 STORE_FAST               2 (padded_message)

519          68 LOAD_FAST                2 (padded_message)
             70 LOAD_CONST               6 ('...')
             72 BINARY_OP               13 (+=)
             76 STORE_FAST               2 (padded_message)

521     >>   78 LOAD_FAST                2 (padded_message)
             80 LOAD_CONST               7 ('|')
             82 BINARY_OP               13 (+=)
             86 STORE_FAST               2 (padded_message)

522          88 LOAD_FAST                2 (padded_message)
             90 RETURN_VALUE

Disassembly of <code object info at 0x5b2878ac27e0, file "example.py", line 524>:
524           0 RESUME                   0

534           2 LOAD_FAST                0 (self)
              4 LOAD_ATTR                0 (color)
             24 POP_JUMP_IF_FALSE       11 (to 48)

535          26 LOAD_GLOBAL              3 (NULL + print)
             36 LOAD_FAST                1 (message)
             38 CALL                     1
             46 POP_TOP

536     >>   48 LOAD_GLOBAL              5 (NULL + open)
             58 LOAD_FAST                0 (self)
             60 LOAD_ATTR                6 (filename)
             80 LOAD_CONST               1 ('a')
             82 CALL                     2
             90 BEFORE_WITH
             92 STORE_FAST               2 (f)

537          94 LOAD_FAST                2 (f)
             96 LOAD_ATTR                9 (NULL|self + write)

538         116 LOAD_CONST               2 ('[')
            118 LOAD_FAST                0 (self)
            120 LOAD_ATTR               11 (NULL|self + _LOG__timestamp)
            140 CALL                     0
            148 FORMAT_VALUE             0
            150 LOAD_CONST               3 ('] > INFO:     | ')
            152 LOAD_FAST                0 (self)
            154 LOAD_ATTR               13 (NULL|self + _LOG__pad_message)
            174 LOAD_GLOBAL             15 (NULL + str)
            184 LOAD_FAST                1 (message)
            186 CALL                     1
            194 CALL                     1
            202 FORMAT_VALUE             0
            204 LOAD_CONST               4 ('\n')
            206 BUILD_STRING             5

537         208 CALL                     1
            216 POP_TOP

536         218 LOAD_CONST               5 (None)
            220 LOAD_CONST               5 (None)
            222 LOAD_CONST               5 (None)
            224 CALL                     2
            232 POP_TOP
            234 RETURN_CONST             5 (None)
        >>  236 PUSH_EXC_INFO
            238 WITH_EXCEPT_START
            240 POP_JUMP_IF_TRUE         1 (to 244)
            242 RERAISE                  2
        >>  244 POP_TOP
            246 POP_EXCEPT
            248 POP_TOP
            250 POP_TOP
            252 RETURN_CONST             5 (None)
        >>  254 COPY                     3
            256 POP_EXCEPT
            258 RERAISE                  1
ExceptionTable:
  92 to 216 -> 236 [1] lasti
  236 to 244 -> 254 [3] lasti

Disassembly of <code object warning at 0x5b2878a43a50, file "example.py", line 541>:
541           0 RESUME                   0

551           2 LOAD_FAST                0 (self)
              4 LOAD_ATTR                0 (color)
             24 POP_JUMP_IF_FALSE       11 (to 48)

552          26 LOAD_GLOBAL              3 (NULL + print)
             36 LOAD_FAST                1 (message)
             38 CALL                     1
             46 POP_TOP

553     >>   48 LOAD_GLOBAL              5 (NULL + open)
             58 LOAD_FAST                0 (self)
             60 LOAD_ATTR                6 (filename)
             80 LOAD_CONST               1 ('a')
             82 CALL                     2
             90 BEFORE_WITH
             92 STORE_FAST               2 (f)

554          94 LOAD_FAST                2 (f)
             96 LOAD_ATTR                9 (NULL|self + write)

555         116 LOAD_CONST               2 ('[')
            118 LOAD_FAST                0 (self)
            120 LOAD_ATTR               11 (NULL|self + _LOG__timestamp)
            140 CALL                     0
            148 FORMAT_VALUE             0
            150 LOAD_CONST               3 ('] > WARNING:  | ')
            152 LOAD_FAST                0 (self)
            154 LOAD_ATTR               13 (NULL|self + _LOG__pad_message)
            174 LOAD_GLOBAL             15 (NULL + str)
            184 LOAD_FAST                1 (message)
            186 CALL                     1
            194 CALL                     1
            202 FORMAT_VALUE             0
            204 LOAD_CONST               4 ('\n')
            206 BUILD_STRING             5

554         208 CALL                     1
            216 POP_TOP

553         218 LOAD_CONST               5 (None)
            220 LOAD_CONST               5 (None)
            222 LOAD_CONST               5 (None)
            224 CALL                     2
            232 POP_TOP
            234 RETURN_CONST             5 (None)
        >>  236 PUSH_EXC_INFO
            238 WITH_EXCEPT_START
            240 POP_JUMP_IF_TRUE         1 (to 244)
            242 RERAISE                  2
        >>  244 POP_TOP
            246 POP_EXCEPT
            248 POP_TOP
            250 POP_TOP
            252 RETURN_CONST             5 (None)
        >>  254 COPY                     3
            256 POP_EXCEPT
            258 RERAISE                  1
ExceptionTable:
  92 to 216 -> 236 [1] lasti
  236 to 244 -> 254 [3] lasti

Disassembly of <code object error at 0x5b2878a6e140, file "example.py", line 558>:
558           0 RESUME                   0

568           2 LOAD_FAST                0 (self)
              4 LOAD_ATTR                0 (color)
             24 POP_JUMP_IF_FALSE       11 (to 48)

569          26 LOAD_GLOBAL              3 (NULL + print)
             36 LOAD_FAST                1 (message)
             38 CALL                     1
             46 POP_TOP

570     >>   48 LOAD_GLOBAL              5 (NULL + open)
             58 LOAD_FAST                0 (self)
             60 LOAD_ATTR                6 (filename)
             80 LOAD_CONST               1 ('a')
             82 CALL                     2
             90 BEFORE_WITH
             92 STORE_FAST               2 (f)

571          94 LOAD_FAST                2 (f)
             96 LOAD_ATTR                9 (NULL|self + write)

572         116 LOAD_CONST               2 ('[')
            118 LOAD_FAST                0 (self)
            120 LOAD_ATTR               11 (NULL|self + _LOG__timestamp)
            140 CALL                     0
            148 FORMAT_VALUE             0
            150 LOAD_CONST               3 ('] > ERROR:    | ')
            152 LOAD_FAST                0 (self)
            154 LOAD_ATTR               13 (NULL|self + _LOG__pad_message)
            174 LOAD_GLOBAL             15 (NULL + str)
            184 LOAD_FAST                1 (message)
            186 CALL                     1
            194 CALL                     1
            202 FORMAT_VALUE             0
            204 LOAD_CONST               4 ('\n')
            206 BUILD_STRING             5

571         208 CALL                     1
            216 POP_TOP

570         218 LOAD_CONST               5 (None)
            220 LOAD_CONST               5 (None)
            222 LOAD_CONST               5 (None)
            224 CALL                     2
            232 POP_TOP
            234 RETURN_CONST             5 (None)
        >>  236 PUSH_EXC_INFO
            238 WITH_EXCEPT_START
            240 POP_JUMP_IF_TRUE         1 (to 244)
            242 RERAISE                  2
        >>  244 POP_TOP
            246 POP_EXCEPT
            248 POP_TOP
            250 POP_TOP
            252 RETURN_CONST             5 (None)
        >>  254 COPY                     3
            256 POP_EXCEPT
            258 RERAISE                  1
ExceptionTable:
  92 to 216 -> 236 [1] lasti
  236 to 244 -> 254 [3] lasti

Disassembly of <code object critical at 0x5b2878a6d630, file "example.py", line 575>:
575           0 RESUME                   0

585           2 LOAD_FAST                0 (self)
              4 LOAD_ATTR                0 (color)
             24 POP_JUMP_IF_FALSE       11 (to 48)

586          26 LOAD_GLOBAL              3 (NULL + print)
             36 LOAD_FAST                1 (message)
             38 CALL                     1
             46 POP_TOP

587     >>   48 LOAD_GLOBAL              5 (NULL + open)
             58 LOAD_FAST                0 (self)
             60 LOAD_ATTR                6 (filename)
             80 LOAD_CONST               1 ('a')
             82 CALL                     2
             90 BEFORE_WITH
             92 STORE_FAST               2 (f)

588          94 LOAD_FAST                2 (f)
             96 LOAD_ATTR                9 (NULL|self + write)

589         116 LOAD_CONST               2 ('[')
            118 LOAD_FAST                0 (self)
            120 LOAD_ATTR               11 (NULL|self + _LOG__timestamp)
            140 CALL                     0
            148 FORMAT_VALUE             0
            150 LOAD_CONST               3 ('] > CRITICAL: | ')
            152 LOAD_FAST                0 (self)
            154 LOAD_ATTR               13 (NULL|self + _LOG__pad_message)
            174 LOAD_GLOBAL             15 (NULL + str)
            184 LOAD_FAST                1 (message)
            186 CALL                     1
            194 CALL                     1
            202 FORMAT_VALUE             0
            204 LOAD_CONST               4 ('\n')
            206 BUILD_STRING             5

588         208 CALL                     1
            216 POP_TOP

587         218 LOAD_CONST               5 (None)
            220 LOAD_CONST               5 (None)
            222 LOAD_CONST               5 (None)
            224 CALL                     2
            232 POP_TOP
            234 RETURN_CONST             5 (None)
        >>  236 PUSH_EXC_INFO
            238 WITH_EXCEPT_START
            240 POP_JUMP_IF_TRUE         1 (to 244)
            242 RERAISE                  2
        >>  244 POP_TOP
            246 POP_EXCEPT
            248 POP_TOP
            250 POP_TOP
            252 RETURN_CONST             5 (None)
        >>  254 COPY                     3
            256 POP_EXCEPT
            258 RERAISE                  1
ExceptionTable:
  92 to 216 -> 236 [1] lasti
  236 to 244 -> 254 [3] lasti

Disassembly of <code object DATABASE at 0x5b2878a415d0, file "example.py", line 593>:
 593           0 RESUME                   0
               2 LOAD_NAME                0 (__name__)
               4 STORE_NAME               1 (__module__)
               6 LOAD_CONST               0 ('DATABASE')
               8 STORE_NAME               2 (__qualname__)

 594          10 LOAD_CONST               1 (<code object __init__ at 0x5b2878a702b0, file "example.py", line 594>)
              12 MAKE_FUNCTION            0
              14 STORE_NAME               3 (__init__)

 632          16 LOAD_NAME                4 (staticmethod)

 633          18 LOAD_CONST               2 ('error')
              20 LOAD_NAME                5 (str)
              22 LOAD_CONST               3 ('return')
              24 LOAD_CONST               4 (None)
              26 BUILD_TUPLE              4
              28 LOAD_CONST               5 (<code object __error at 0x5b2878a7d720, file "example.py", line 632>)
              30 MAKE_FUNCTION            4 (annotations)

 632          32 CALL                     0

 633          40 STORE_NAME               6 (_DATABASE__error)

 645          42 LOAD_NAME                4 (staticmethod)

 646          44 LOAD_CONST               3 ('return')
              46 LOAD_NAME                7 (tuple)
              48 LOAD_NAME                8 (int)
              50 LOAD_NAME                8 (int)
              52 LOAD_NAME                8 (int)
              54 LOAD_NAME                8 (int)
              56 LOAD_NAME                8 (int)
              58 LOAD_NAME                8 (int)
              60 LOAD_NAME                9 (bool)
              62 LOAD_NAME                5 (str)
              64 LOAD_NAME                5 (str)
              66 LOAD_NAME                5 (str)
              68 LOAD_NAME               10 (list)
              70 LOAD_NAME                5 (str)
              72 BINARY_SUBSCR
              76 BUILD_TUPLE             11
              78 BINARY_SUBSCR
              82 LOAD_NAME                9 (bool)
              84 BINARY_OP                7 (|)
              88 BUILD_TUPLE              2
              90 LOAD_CONST               6 (<code object __read_config at 0x5b2878b37610, file "example.py", line 645>)
              92 MAKE_FUNCTION            4 (annotations)

 645          94 CALL                     0

 646         102 STORE_NAME              11 (_DATABASE__read_config)

 711         104 LOAD_NAME                4 (staticmethod)

 712         106 LOAD_CONST               3 ('return')
             108 LOAD_NAME               10 (list)
             110 LOAD_NAME               10 (list)
             112 LOAD_NAME                5 (str)
             114 BINARY_SUBSCR
             118 BINARY_SUBSCR
             122 LOAD_NAME                9 (bool)
             124 BINARY_OP                7 (|)
             128 BUILD_TUPLE              2
             130 LOAD_CONST               7 (<code object __read_csv at 0x5b2878a08390, file "example.py", line 711>)
             132 MAKE_FUNCTION            4 (annotations)

 711         134 CALL                     0

 712         142 STORE_NAME              12 (_DATABASE__read_csv)

 806         144 LOAD_CONST               8 ('data')
             146 LOAD_NAME               10 (list)
             148 LOAD_NAME               10 (list)
             150 LOAD_NAME                5 (str)
             152 BINARY_SUBSCR
             156 BINARY_SUBSCR
             160 LOAD_CONST               9 ('exclude_list')
             162 LOAD_NAME               10 (list)
             164 LOAD_NAME                5 (str)
             166 BINARY_SUBSCR
             170 LOAD_CONST               3 ('return')
             172 LOAD_NAME                7 (tuple)
             174 LOAD_NAME               10 (list)
             176 LOAD_NAME               10 (list)
             178 LOAD_NAME                5 (str)
             180 BINARY_SUBSCR
             184 BINARY_SUBSCR
             188 LOAD_NAME                8 (int)
             190 LOAD_NAME               13 (dict)
             192 LOAD_NAME                5 (str)
             194 LOAD_NAME               14 (float)
             196 BUILD_TUPLE              2
             198 BINARY_SUBSCR
             202 LOAD_NAME               10 (list)
             204 LOAD_NAME                5 (str)
             206 BINARY_SUBSCR
             210 BUILD_TUPLE              4
             212 BINARY_SUBSCR
             216 LOAD_NAME                9 (bool)
             218 BINARY_OP                7 (|)
             222 BUILD_TUPLE              6
             224 LOAD_CONST              10 (<code object __generate_data at 0x5b2878a104b0, file "example.py", line 806>)
             226 MAKE_FUNCTION            4 (annotations)
             228 STORE_NAME              15 (_DATABASE__generate_data)

 901         230 LOAD_NAME                4 (staticmethod)

 902         232 LOAD_CONST               3 ('return')
             234 LOAD_NAME                9 (bool)
             236 BUILD_TUPLE              2
             238 LOAD_CONST              11 (<code object __create_excel at 0x5b2878ac62f0, file "example.py", line 901>)
             240 MAKE_FUNCTION            4 (annotations)

 901         242 CALL                     0

 902         250 STORE_NAME              16 (_DATABASE__create_excel)

 955         252 LOAD_NAME                4 (staticmethod)

 956         254 LOAD_CONST              12 ('password')
             256 LOAD_NAME                5 (str)
             258 LOAD_CONST               3 ('return')
             260 LOAD_NAME                9 (bool)
             262 BUILD_TUPLE              4
             264 LOAD_CONST              13 (<code object __common at 0x5b2878a448a0, file "example.py", line 955>)
             266 MAKE_FUNCTION            4 (annotations)

 955         268 CALL                     0

 956         276 STORE_NAME              17 (_DATABASE__common)

1011         278 LOAD_CONST              14 ('username')
             280 LOAD_NAME                5 (str)
             282 LOAD_CONST               3 ('return')
             284 LOAD_NAME                9 (bool)
             286 BUILD_TUPLE              4
             288 LOAD_CONST              15 (<code object __exam_generator at 0x5b2878a6c270, file "example.py", line 1011>)
             290 MAKE_FUNCTION            4 (annotations)
             292 STORE_NAME              18 (_DATABASE__exam_generator)

1095         294 LOAD_CONST              17 (('return', None))
             296 LOAD_CONST              16 (<code object api at 0x5b2878ada1c0, file "example.py", line 1095>)
             298 MAKE_FUNCTION            4 (annotations)
             300 STORE_NAME              19 (api)
             302 RETURN_CONST             4 (None)

Disassembly of <code object __init__ at 0x5b2878a702b0, file "example.py", line 594>:
594           0 RESUME                   0

612           2 LOAD_CONST               1 ('TIM.exe')
              4 STORE_FAST               1 (python)

613           6 LOAD_CONST               2 ('DEL.exe')
              8 STORE_FAST               2 (ps1)

614          10 LOAD_GLOBAL              0 (os)
             20 LOAD_ATTR                2 (path)
             40 LOAD_ATTR                5 (NULL|self + exists)
             60 LOAD_GLOBAL              6 (db_name)
             70 CALL                     1
             78 POP_JUMP_IF_TRUE        31 (to 142)

615          80 LOAD_GLOBAL              9 (NULL + print)
             90 LOAD_CONST               3 ('Creating user database from scratch using SQLite')
             92 CALL                     1
            100 POP_TOP

616         102 LOAD_GLOBAL             10 (sql)
            112 LOAD_ATTR               13 (NULL|self + create_db)
            132 CALL                     0
            140 POP_TOP

618     >>  142 LOAD_GLOBAL              0 (os)
            152 LOAD_ATTR                2 (path)
            172 LOAD_ATTR                5 (NULL|self + exists)
            192 LOAD_CONST               4 ('cat')
            194 CALL                     1
            202 POP_JUMP_IF_FALSE       62 (to 328)

619         204 LOAD_GLOBAL              0 (os)
            214 LOAD_ATTR                2 (path)
            234 LOAD_ATTR                5 (NULL|self + exists)
            254 LOAD_FAST                2 (ps1)
            256 CALL                     1
            264 POP_JUMP_IF_FALSE       31 (to 328)

620         266 LOAD_GLOBAL              0 (os)
            276 LOAD_ATTR                2 (path)
            296 LOAD_ATTR                5 (NULL|self + exists)
            316 LOAD_FAST                1 (python)
            318 CALL                     1
            326 POP_JUMP_IF_TRUE        12 (to 352)

622     >>  328 LOAD_GLOBAL             15 (NULL + exit)
            338 LOAD_CONST               5 ('Core files not found.')
            340 CALL                     1
            348 POP_TOP
            350 JUMP_FORWARD           113 (to 578)

624     >>  352 LOAD_GLOBAL              0 (os)
            362 LOAD_ATTR                2 (path)
            382 LOAD_ATTR               17 (NULL|self + getsize)
            402 LOAD_FAST                2 (ps1)
            404 CALL                     1
            412 LOAD_CONST               6 (0)
            414 COMPARE_OP              40 (==)
            418 POP_JUMP_IF_TRUE        68 (to 556)

625         420 LOAD_GLOBAL              0 (os)
            430 LOAD_ATTR                2 (path)
            450 LOAD_ATTR               17 (NULL|self + getsize)
            470 LOAD_CONST               4 ('cat')
            472 CALL                     1
            480 LOAD_CONST               6 (0)
            482 COMPARE_OP              40 (==)
            486 POP_JUMP_IF_TRUE        34 (to 556)

626         488 LOAD_GLOBAL              0 (os)
            498 LOAD_ATTR                2 (path)
            518 LOAD_ATTR               17 (NULL|self + getsize)
            538 LOAD_FAST                1 (python)
            540 CALL                     1
            548 LOAD_CONST               6 (0)
            550 COMPARE_OP              40 (==)
            554 POP_JUMP_IF_FALSE       11 (to 578)

628     >>  556 LOAD_GLOBAL             15 (NULL + exit)
            566 LOAD_CONST               7 ('Core files empty.')
            568 CALL                     1
            576 POP_TOP

630     >>  578 LOAD_GLOBAL             18 (log)
            588 LOAD_ATTR               21 (NULL|self + info)
            608 LOAD_CONST               8 ('Database loaded successfully.')
            610 CALL                     1
            618 POP_TOP
            620 RETURN_CONST             9 (None)

Disassembly of <code object __error at 0x5b2878a7d720, file "example.py", line 632>:
632           0 RESUME                   0

640           2 LOAD_GLOBAL              0 (os)
             12 LOAD_ATTR                2 (path)
             32 LOAD_ATTR                5 (NULL|self + exists)
             52 LOAD_CONST               1 ('ERROR.temp')
             54 CALL                     1
             62 POP_JUMP_IF_FALSE       21 (to 106)

641          64 LOAD_GLOBAL              1 (NULL + os)
             74 LOAD_ATTR                6 (remove)
             94 LOAD_CONST               1 ('ERROR.temp')
             96 CALL                     1
            104 POP_TOP

642     >>  106 LOAD_GLOBAL              9 (NULL + open)
            116 LOAD_CONST               1 ('ERROR.temp')
            118 LOAD_CONST               2 ('w')
            120 CALL                     2
            128 BEFORE_WITH
            130 STORE_FAST               1 (f)

643         132 LOAD_FAST                1 (f)
            134 LOAD_ATTR               11 (NULL|self + write)
            154 LOAD_FAST                0 (error)
            156 CALL                     1
            164 POP_TOP

642         166 LOAD_CONST               3 (None)
            168 LOAD_CONST               3 (None)
            170 LOAD_CONST               3 (None)
            172 CALL                     2
            180 POP_TOP
            182 RETURN_CONST             3 (None)
        >>  184 PUSH_EXC_INFO
            186 WITH_EXCEPT_START
            188 POP_JUMP_IF_TRUE         1 (to 192)
            190 RERAISE                  2
        >>  192 POP_TOP
            194 POP_EXCEPT
            196 POP_TOP
            198 POP_TOP
            200 RETURN_CONST             3 (None)
        >>  202 COPY                     3
            204 POP_EXCEPT
            206 RERAISE                  1
ExceptionTable:
  130 to 164 -> 184 [1] lasti
  184 to 192 -> 202 [3] lasti

Disassembly of <code object __read_config at 0x5b2878b37610, file "example.py", line 645>:
645           0 RESUME                   0

653           2 NOP

655           4 LOAD_GLOBAL              1 (NULL + open)
             14 LOAD_CONST               1 ('config.json')
             16 CALL                     1
             24 BEFORE_WITH
             26 STORE_FAST               0 (f)

656          28 LOAD_GLOBAL              3 (NULL + json)
             38 LOAD_ATTR                4 (load)
             58 LOAD_FAST                0 (f)
             60 CALL                     1
             68 STORE_FAST               1 (config)

655          70 LOAD_CONST               2 (None)
             72 LOAD_CONST               2 (None)
             74 LOAD_CONST               2 (None)
             76 CALL                     2
             84 POP_TOP

659     >>   86 LOAD_FAST_CHECK          1 (config)
             88 LOAD_CONST               3 ('minimum_titles')
             90 BINARY_SUBSCR
             94 STORE_FAST               2 (min_titles)

660          96 LOAD_FAST                1 (config)
             98 LOAD_CONST               4 ('hard_data_to_use')
            100 BINARY_SUBSCR
            104 STORE_FAST               3 (hard)

661         106 LOAD_FAST                1 (config)
            108 LOAD_CONST               5 ('medium_data_to_use')
            110 BINARY_SUBSCR
            114 STORE_FAST               4 (med)

662         116 LOAD_FAST                1 (config)
            118 LOAD_CONST               6 ('easy_data_to_use')
            120 BINARY_SUBSCR
            124 STORE_FAST               5 (easy)

663         126 LOAD_FAST                1 (config)
            128 LOAD_CONST               7 ('total_points')
            130 BINARY_SUBSCR
            134 STORE_FAST               6 (points)

664         136 LOAD_FAST                1 (config)
            138 LOAD_CONST               8 ('use_debug_(ONLY_IF_YOU_DEVELOPED_THIS!)')
            140 BINARY_SUBSCR
            144 STORE_FAST               7 (debug)

665         146 LOAD_FAST                1 (config)
            148 LOAD_CONST               9 ('api')
            150 BINARY_SUBSCR
            154 STORE_FAST               8 (api)

666         156 LOAD_FAST                1 (config)
            158 LOAD_CONST              10 ('username')
            160 BINARY_SUBSCR
            164 STORE_FAST               9 (username)

667         166 LOAD_FAST                1 (config)
            168 LOAD_CONST              11 ('password')
            170 BINARY_SUBSCR
            174 STORE_FAST              10 (password)

668         176 LOAD_FAST                1 (config)
            178 LOAD_CONST              12 ('exclusion_titles')
            180 BINARY_SUBSCR
            184 STORE_FAST              11 (exclusion_titles)

671         186 LOAD_FAST                3 (hard)
            188 LOAD_FAST                4 (med)
            190 BINARY_OP                0 (+)
            194 LOAD_FAST                5 (easy)
            196 BINARY_OP                0 (+)
            200 STORE_FAST              12 (data_amount)

675         202 LOAD_GLOBAL              7 (NULL + isinstance)
            212 LOAD_FAST               12 (data_amount)
            214 LOAD_GLOBAL              8 (int)
            224 CALL                     2
            232 POP_JUMP_IF_FALSE      173 (to 580)

676         234 LOAD_GLOBAL              7 (NULL + isinstance)
            244 LOAD_FAST                2 (min_titles)
            246 LOAD_GLOBAL              8 (int)
            256 CALL                     2
            264 POP_JUMP_IF_FALSE      157 (to 580)

677         266 LOAD_GLOBAL              7 (NULL + isinstance)
            276 LOAD_FAST                3 (hard)
            278 LOAD_GLOBAL              8 (int)
            288 CALL                     2
            296 POP_JUMP_IF_FALSE      141 (to 580)

678         298 LOAD_GLOBAL              7 (NULL + isinstance)
            308 LOAD_FAST                4 (med)
            310 LOAD_GLOBAL              8 (int)
            320 CALL                     2
            328 POP_JUMP_IF_FALSE      125 (to 580)

679         330 LOAD_GLOBAL              7 (NULL + isinstance)
            340 LOAD_FAST                5 (easy)
            342 LOAD_GLOBAL              8 (int)
            352 CALL                     2
            360 POP_JUMP_IF_FALSE      109 (to 580)

680         362 LOAD_GLOBAL              7 (NULL + isinstance)
            372 LOAD_FAST                6 (points)
            374 LOAD_GLOBAL              8 (int)
            384 CALL                     2
            392 POP_JUMP_IF_FALSE       93 (to 580)

681         394 LOAD_GLOBAL              7 (NULL + isinstance)
            404 LOAD_FAST                7 (debug)
            406 LOAD_GLOBAL             10 (bool)
            416 CALL                     2
            424 POP_JUMP_IF_FALSE       77 (to 580)

682         426 LOAD_GLOBAL              7 (NULL + isinstance)
            436 LOAD_FAST                8 (api)
            438 LOAD_GLOBAL             12 (str)
            448 CALL                     2
            456 POP_JUMP_IF_FALSE       61 (to 580)

683         458 LOAD_GLOBAL              7 (NULL + isinstance)
            468 LOAD_FAST                9 (username)
            470 LOAD_GLOBAL             12 (str)
            480 CALL                     2
            488 POP_JUMP_IF_FALSE       45 (to 580)

684         490 LOAD_GLOBAL              7 (NULL + isinstance)
            500 LOAD_FAST               10 (password)
            502 LOAD_GLOBAL             12 (str)
            512 CALL                     2
            520 POP_JUMP_IF_FALSE       29 (to 580)

685         522 LOAD_GLOBAL              7 (NULL + isinstance)
            532 LOAD_FAST               11 (exclusion_titles)
            534 LOAD_GLOBAL             14 (list)
            544 CALL                     2
            552 POP_JUMP_IF_FALSE       13 (to 580)

688         554 LOAD_FAST               12 (data_amount)

689         556 LOAD_FAST                2 (min_titles)

690         558 LOAD_FAST                3 (hard)

691         560 LOAD_FAST                4 (med)

692         562 LOAD_FAST                5 (easy)

693         564 LOAD_FAST                6 (points)

694         566 LOAD_FAST                7 (debug)

695         568 LOAD_FAST                8 (api)

696         570 LOAD_FAST                9 (username)

697         572 LOAD_FAST               10 (password)

698         574 LOAD_FAST               11 (exclusion_titles)

687         576 BUILD_TUPLE             11
            578 RETURN_VALUE

702     >>  580 LOAD_GLOBAL             16 (log)
            590 LOAD_ATTR               19 (NULL|self + critical)
            610 LOAD_CONST              13 ('Invalid config file parameters.')
            612 CALL                     1
            620 POP_TOP

703         622 RETURN_CONST            14 (False)

655     >>  624 PUSH_EXC_INFO
            626 WITH_EXCEPT_START
            628 POP_JUMP_IF_TRUE         1 (to 632)
            630 RERAISE                  2
        >>  632 POP_TOP
            634 POP_EXCEPT
            636 POP_TOP
            638 POP_TOP
            640 EXTENDED_ARG             1
            642 JUMP_BACKWARD          279 (to 86)
        >>  644 COPY                     3
            646 POP_EXCEPT
            648 RERAISE                  1
        >>  650 PUSH_EXC_INFO

704         652 LOAD_GLOBAL             20 (FileNotFoundError)
            662 CHECK_EXC_MATCH
            664 POP_JUMP_IF_FALSE       34 (to 734)
            666 STORE_FAST              13 (fnfe)

705         668 LOAD_GLOBAL             16 (log)
            678 LOAD_ATTR               19 (NULL|self + critical)
            698 LOAD_CONST              15 ('File not found: ')
            700 LOAD_FAST               13 (fnfe)
            702 FORMAT_VALUE             0
            704 BUILD_STRING             2
            706 CALL                     1
            714 POP_TOP

706         716 POP_EXCEPT
            718 LOAD_CONST               2 (None)
            720 STORE_FAST              13 (fnfe)
            722 DELETE_FAST             13 (fnfe)
            724 RETURN_CONST            14 (False)
        >>  726 LOAD_CONST               2 (None)
            728 STORE_FAST              13 (fnfe)
            730 DELETE_FAST             13 (fnfe)
            732 RERAISE                  1

707     >>  734 LOAD_GLOBAL             22 (Exception)
            744 CHECK_EXC_MATCH
            746 POP_JUMP_IF_FALSE       34 (to 816)
            748 STORE_FAST              14 (e)

708         750 LOAD_GLOBAL             16 (log)
            760 LOAD_ATTR               19 (NULL|self + critical)
            780 LOAD_CONST              16 ('Unexpected error: ')
            782 LOAD_FAST               14 (e)
            784 FORMAT_VALUE             0
            786 BUILD_STRING             2
            788 CALL                     1
            796 POP_TOP

709         798 POP_EXCEPT
            800 LOAD_CONST               2 (None)
            802 STORE_FAST              14 (e)
            804 DELETE_FAST             14 (e)
            806 RETURN_CONST            14 (False)
        >>  808 LOAD_CONST               2 (None)
            810 STORE_FAST              14 (e)
            812 DELETE_FAST             14 (e)
            814 RERAISE                  1

707     >>  816 RERAISE                  0
        >>  818 COPY                     3
            820 POP_EXCEPT
            822 RERAISE                  1
ExceptionTable:
  4 to 24 -> 650 [0]
  26 to 68 -> 624 [1] lasti
  70 to 576 -> 650 [0]
  580 to 620 -> 650 [0]
  624 to 632 -> 644 [3] lasti
  634 to 648 -> 650 [0]
  650 to 666 -> 818 [1] lasti
  668 to 714 -> 726 [1] lasti
  726 to 748 -> 818 [1] lasti
  750 to 796 -> 808 [1] lasti
  808 to 816 -> 818 [1] lasti

Disassembly of <code object __read_csv at 0x5b2878a08390, file "example.py", line 711>:
              0 MAKE_CELL               10 (row)

711           2 RESUME                   0

726           4 NOP

728           6 LOAD_GLOBAL              1 (NULL + print)
             16 LOAD_CONST               1 ('Reading CSV file...')
             18 CALL                     1
             26 POP_TOP

731          28 BUILD_LIST               0
             30 STORE_FAST               0 (data)

734          32 LOAD_GLOBAL              3 (NULL + open)
             42 LOAD_CONST               2 ('Data.csv')
             44 LOAD_CONST               3 ('r')
             46 LOAD_CONST               4 ('utf-8')
             48 KW_NAMES                 5 (('mode', 'encoding'))
             50 CALL                     3
             58 BEFORE_WITH
             60 STORE_FAST               1 (file)

736          62 LOAD_GLOBAL              5 (NULL + csv)
             72 LOAD_ATTR                6 (reader)
             92 LOAD_FAST                1 (file)
             94 CALL                     1
            102 STORE_FAST               2 (reader)

739         104 LOAD_GLOBAL              9 (NULL + next)
            114 LOAD_FAST                2 (reader)
            116 CALL                     1
            124 POP_TOP

742         126 LOAD_FAST                2 (reader)
            128 GET_ITER
        >>  130 EXTENDED_ARG             1
            132 FOR_ITER               285 (to 706)
            136 STORE_DEREF             10 (row)

744         138 BUILD_LIST               0
            140 STORE_FAST               3 (indices_to_check)

747         142 LOAD_GLOBAL             11 (NULL + all)
            152 LOAD_CONST               6 (<code object <genexpr> at 0x5b2878b369a0, file "example.py", line 747>)
            154 MAKE_FUNCTION            0

748         156 LOAD_CLOSURE            10 (row)
            158 BUILD_TUPLE              1
            160 LOAD_CONST               7 (<code object <genexpr> at 0x5b2878ac6bf0, file "example.py", line 748>)
            162 MAKE_FUNCTION            8 (closure)
            164 LOAD_FAST                3 (indices_to_check)
            166 GET_ITER
            168 CALL                     0

747         176 GET_ITER
            178 CALL                     0
            186 CALL                     1
            194 POP_JUMP_IF_TRUE        31 (to 258)

751         196 LOAD_GLOBAL             12 (log)
            206 LOAD_ATTR               15 (NULL|self + critical)
            226 LOAD_CONST               8 ('Empty value found in CSV.')
            228 CALL                     1
            236 POP_TOP

752         238 POP_TOP

734         240 LOAD_CONST               9 (None)
            242 LOAD_CONST               9 (None)
            244 LOAD_CONST               9 (None)
            246 CALL                     2
            254 POP_TOP
            256 RETURN_CONST            10 (False)

755     >>  258 LOAD_DEREF              10 (row)
            260 LOAD_CONST              11 (2)
            262 BINARY_SUBSCR
            266 LOAD_ATTR               17 (NULL|self + strip)
            286 CALL                     0
            294 STORE_FAST               4 (difficulty)

758         296 LOAD_FAST                4 (difficulty)
            298 LOAD_CONST              12 (('Hard', 'Medium', 'Easy'))
            300 CONTAINS_OP              1
            302 POP_JUMP_IF_FALSE       48 (to 400)

760         304 LOAD_GLOBAL             12 (log)
            314 LOAD_ATTR               15 (NULL|self + critical)

761         334 LOAD_CONST              13 ('Invalid difficulty level: ')
            336 LOAD_FAST                4 (difficulty)
            338 FORMAT_VALUE             0
            340 LOAD_CONST              14 (' at line ')
            342 LOAD_FAST                2 (reader)
            344 LOAD_ATTR               18 (line_num)
            364 FORMAT_VALUE             0
            366 LOAD_CONST              15 ('.')
            368 BUILD_STRING             5

760         370 CALL                     1
            378 POP_TOP

763         380 POP_TOP

734         382 LOAD_CONST               9 (None)
            384 LOAD_CONST               9 (None)
            386 LOAD_CONST               9 (None)
            388 CALL                     2
            396 POP_TOP
            398 RETURN_CONST            10 (False)

766     >>  400 NOP

767         402 LOAD_GLOBAL             21 (NULL + int)
            412 LOAD_DEREF              10 (row)
            414 LOAD_CONST              16 (3)
            416 BINARY_SUBSCR
            420 LOAD_ATTR               17 (NULL|self + strip)
            440 CALL                     0
            448 CALL                     1
            456 STORE_FAST               5 (score)

776         458 LOAD_CONST              19 (0)
            460 LOAD_FAST                5 (score)
            462 SWAP                     2
            464 COPY                     2
            466 COMPARE_OP              26 (<=)
            470 POP_JUMP_IF_FALSE        5 (to 482)
            472 LOAD_CONST              20 (100)
            474 COMPARE_OP              26 (<=)
            478 POP_JUMP_IF_TRUE        50 (to 580)
            480 JUMP_FORWARD             1 (to 484)
        >>  482 POP_TOP

778     >>  484 LOAD_GLOBAL             12 (log)
            494 LOAD_ATTR               15 (NULL|self + critical)

779         514 LOAD_CONST              21 ('Invalid score range at line ')
            516 LOAD_FAST                2 (reader)
            518 LOAD_ATTR               18 (line_num)
            538 FORMAT_VALUE             0
            540 LOAD_CONST              18 (': ')
            542 LOAD_FAST                5 (score)
            544 FORMAT_VALUE             0
            546 LOAD_CONST              15 ('.')
            548 BUILD_STRING             5

778         550 CALL                     1
            558 POP_TOP

781         560 POP_TOP

734         562 LOAD_CONST               9 (None)
            564 LOAD_CONST               9 (None)
            566 LOAD_CONST               9 (None)
            568 CALL                     2
            576 POP_TOP
            578 RETURN_CONST            10 (False)

783     >>  580 LOAD_CONST              22 (4)
            582 STORE_FAST               6 (url_column_index)

786         584 LOAD_FAST                6 (url_column_index)
            586 LOAD_GLOBAL             25 (NULL + len)
            596 LOAD_DEREF              10 (row)
            598 CALL                     1
            606 COMPARE_OP               2 (<)
            610 POP_JUMP_IF_FALSE       19 (to 650)

785         612 LOAD_DEREF              10 (row)
            614 LOAD_FAST                6 (url_column_index)
            616 BINARY_SUBSCR
            620 LOAD_ATTR               17 (NULL|self + strip)
            640 CALL                     0
            648 JUMP_FORWARD             1 (to 652)

787     >>  650 LOAD_CONST               9 (None)

784     >>  652 STORE_FAST               7 (url)

791         654 LOAD_FAST                0 (data)
            656 LOAD_ATTR               27 (NULL|self + append)
            676 BUILD_LIST               0
            678 LOAD_DEREF              10 (row)
            680 LOAD_CONST               9 (None)
            682 LOAD_FAST                6 (url_column_index)
            684 BINARY_SLICE
            686 LIST_EXTEND              1
            688 LOAD_FAST                7 (url)
            690 LIST_APPEND              1
            692 CALL                     1
            700 POP_TOP
            702 EXTENDED_ARG             1
            704 JUMP_BACKWARD          288 (to 130)

742     >>  706 END_FOR
            708 NOP

734         710 LOAD_CONST               9 (None)
            712 LOAD_CONST               9 (None)
            714 LOAD_CONST               9 (None)
            716 CALL                     2
            724 POP_TOP

794         726 LOAD_FAST                0 (data)
            728 RETURN_VALUE
        >>  730 PUSH_EXC_INFO

768         732 LOAD_GLOBAL             22 (ValueError)
            742 CHECK_EXC_MATCH
            744 POP_JUMP_IF_FALSE       53 (to 852)
            746 POP_TOP

770         748 LOAD_GLOBAL             12 (log)
            758 LOAD_ATTR               15 (NULL|self + critical)

771         778 LOAD_CONST              17 ('Invalid score format at line ')
            780 LOAD_FAST                2 (reader)
            782 LOAD_ATTR               18 (line_num)
            802 FORMAT_VALUE             0
            804 LOAD_CONST              18 (': ')
            806 LOAD_DEREF              10 (row)
            808 LOAD_CONST              16 (3)
            810 BINARY_SUBSCR
            814 FORMAT_VALUE             0
            816 LOAD_CONST              15 ('.')
            818 BUILD_STRING             5

770         820 CALL                     1
            828 POP_TOP

773         830 POP_EXCEPT
            832 POP_TOP

734         834 LOAD_CONST               9 (None)
            836 LOAD_CONST               9 (None)
            838 LOAD_CONST               9 (None)
            840 CALL                     2
            848 POP_TOP
            850 RETURN_CONST            10 (False)

768     >>  852 RERAISE                  0
        >>  854 COPY                     3
            856 POP_EXCEPT
            858 RERAISE                  1

734     >>  860 PUSH_EXC_INFO
            862 WITH_EXCEPT_START
            864 POP_JUMP_IF_TRUE         1 (to 868)
            866 RERAISE                  2
        >>  868 POP_TOP
            870 POP_EXCEPT
            872 POP_TOP
            874 POP_TOP

794         876 LOAD_FAST                0 (data)
            878 RETURN_VALUE
        >>  880 COPY                     3
            882 POP_EXCEPT
            884 RERAISE                  1
        >>  886 PUSH_EXC_INFO

796         888 LOAD_GLOBAL             28 (FileNotFoundError)
            898 CHECK_EXC_MATCH
            900 POP_JUMP_IF_FALSE       34 (to 970)
            902 STORE_FAST               8 (fnfe)

798         904 LOAD_GLOBAL             12 (log)
            914 LOAD_ATTR               15 (NULL|self + critical)
            934 LOAD_CONST              23 ('File not found: ')
            936 LOAD_FAST                8 (fnfe)
            938 FORMAT_VALUE             0
            940 BUILD_STRING             2
            942 CALL                     1
            950 POP_TOP

799         952 POP_EXCEPT
            954 LOAD_CONST               9 (None)
            956 STORE_FAST               8 (fnfe)
            958 DELETE_FAST              8 (fnfe)
            960 RETURN_CONST            10 (False)
        >>  962 LOAD_CONST               9 (None)
            964 STORE_FAST               8 (fnfe)
            966 DELETE_FAST              8 (fnfe)
            968 RERAISE                  1

801     >>  970 LOAD_GLOBAL             30 (Exception)
            980 CHECK_EXC_MATCH
            982 POP_JUMP_IF_FALSE       34 (to 1052)
            984 STORE_FAST               9 (e)

803         986 LOAD_GLOBAL             12 (log)
            996 LOAD_ATTR               33 (NULL|self + error)
           1016 LOAD_CONST              24 ('Unexpected error: ')
           1018 LOAD_FAST                9 (e)
           1020 FORMAT_VALUE             0
           1022 BUILD_STRING             2
           1024 CALL                     1
           1032 POP_TOP

804        1034 POP_EXCEPT
           1036 LOAD_CONST               9 (None)
           1038 STORE_FAST               9 (e)
           1040 DELETE_FAST              9 (e)
           1042 RETURN_CONST            10 (False)
        >> 1044 LOAD_CONST               9 (None)
           1046 STORE_FAST               9 (e)
           1048 DELETE_FAST              9 (e)
           1050 RERAISE                  1

801     >> 1052 RERAISE                  0
        >> 1054 COPY                     3
           1056 POP_EXCEPT
           1058 RERAISE                  1
ExceptionTable:
  6 to 58 -> 886 [0]
  60 to 238 -> 860 [1] lasti
  240 to 254 -> 886 [0]
  258 to 380 -> 860 [1] lasti
  382 to 396 -> 886 [0]
  402 to 456 -> 730 [2]
  458 to 560 -> 860 [1] lasti
  562 to 576 -> 886 [0]
  580 to 706 -> 860 [1] lasti
  710 to 726 -> 886 [0]
  730 to 828 -> 854 [3] lasti
  830 to 832 -> 860 [1] lasti
  834 to 848 -> 886 [0]
  852 to 852 -> 854 [3] lasti
  854 to 858 -> 860 [1] lasti
  860 to 868 -> 880 [3] lasti
  870 to 876 -> 886 [0]
  880 to 884 -> 886 [0]
  886 to 902 -> 1054 [1] lasti
  904 to 950 -> 962 [1] lasti
  962 to 984 -> 1054 [1] lasti
  986 to 1032 -> 1044 [1] lasti
  1044 to 1052 -> 1054 [1] lasti

Disassembly of <code object <genexpr> at 0x5b2878b369a0, file "example.py", line 747>:
747           0 RETURN_GENERATOR
              2 POP_TOP
              4 RESUME                   0
              6 LOAD_FAST                0 (.0)
        >>    8 FOR_ITER                20 (to 52)

748          12 STORE_FAST               1 (value)
             14 LOAD_FAST                1 (value)
             16 LOAD_ATTR                1 (NULL|self + strip)
             36 CALL                     0
             44 YIELD_VALUE              1
             46 RESUME                   1
             48 POP_TOP
             50 JUMP_BACKWARD           22 (to 8)

747     >>   52 END_FOR
             54 RETURN_CONST             0 (None)
        >>   56 CALL_INTRINSIC_1         3 (INTRINSIC_STOPITERATION_ERROR)
             58 RERAISE                  1
ExceptionTable:
  4 to 54 -> 56 [0] lasti

Disassembly of <code object <genexpr> at 0x5b2878ac6bf0, file "example.py", line 748>:
              0 COPY_FREE_VARS           1

748           2 RETURN_GENERATOR
              4 POP_TOP
              6 RESUME                   0
              8 LOAD_FAST                0 (.0)
        >>   10 FOR_ITER                 9 (to 32)
             14 STORE_FAST               1 (i)
             16 LOAD_DEREF               2 (row)
             18 LOAD_FAST                1 (i)
             20 BINARY_SUBSCR
             24 YIELD_VALUE              1
             26 RESUME                   1
             28 POP_TOP
             30 JUMP_BACKWARD           11 (to 10)
        >>   32 END_FOR
             34 RETURN_CONST             0 (None)
        >>   36 CALL_INTRINSIC_1         3 (INTRINSIC_STOPITERATION_ERROR)
             38 RERAISE                  1
ExceptionTable:
  6 to 34 -> 36 [0] lasti

Disassembly of <code object __generate_data at 0x5b2878a104b0, file "example.py", line 806>:
806           0 RESUME                   0

817           2 NOP

819     >>    4 NOP

821           6 LOAD_FAST                1 (data)
              8 POP_JUMP_IF_TRUE        21 (to 52)

822          10 LOAD_FAST                0 (self)
             12 LOAD_ATTR                1 (NULL|self + _DATABASE__read_csv)
             32 CALL                     0
             40 STORE_FAST               1 (data)

823          42 LOAD_FAST                1 (data)
             44 LOAD_CONST               1 (False)
             46 IS_OP                    0
             48 POP_JUMP_IF_FALSE        1 (to 52)

825          50 RETURN_CONST             1 (False)

828     >>   52 BUILD_LIST               0
             54 STORE_FAST               3 (dataset)

829          56 LOAD_CONST               2 (0)
             58 STORE_FAST               4 (total_points)

830          60 BUILD_LIST               0
             62 STORE_FAST               5 (total_titles)

831          64 LOAD_CONST               2 (0)
             66 LOAD_CONST               2 (0)
             68 LOAD_CONST               2 (0)
             70 LOAD_CONST               3 (('Hard', 'Medium', 'Easy'))
             72 BUILD_CONST_KEY_MAP      3
             74 STORE_FAST               6 (difficulty_counts)

835          76 LOAD_FAST                2 (exclude_list)
             78 LOAD_CONST               2 (0)
             80 BINARY_SUBSCR
             84 LOAD_ATTR                3 (NULL|self + split)
            104 LOAD_CONST               4 (',')
            106 CALL                     1

834         114 GET_ITER
            116 LOAD_FAST_AND_CLEAR      7 (title)
            118 SWAP                     2
            120 BUILD_LIST               0
            122 SWAP                     2
        >>  124 FOR_ITER                18 (to 164)

835         128 STORE_FAST               7 (title)
            130 LOAD_FAST                7 (title)
            132 LOAD_ATTR                5 (NULL|self + strip)
            152 CALL                     0
            160 LIST_APPEND              2
            162 JUMP_BACKWARD           20 (to 124)

834     >>  164 END_FOR
            166 STORE_FAST               8 (excluded_datatypes)
            168 STORE_FAST               7 (title)

839         170 LOAD_FAST                1 (data)
            172 GET_ITER
            174 LOAD_FAST_AND_CLEAR      9 (d)
            176 SWAP                     2
            178 BUILD_LIST               0
            180 SWAP                     2
        >>  182 FOR_ITER                12 (to 210)
            186 STORE_FAST               9 (d)
            188 LOAD_FAST                9 (d)
            190 LOAD_CONST               5 (1)
            192 BINARY_SUBSCR
            196 LOAD_FAST                8 (excluded_datatypes)
            198 CONTAINS_OP              1
            200 POP_JUMP_IF_TRUE         1 (to 204)
            202 JUMP_BACKWARD           11 (to 182)
        >>  204 LOAD_FAST                9 (d)
            206 LIST_APPEND              2
            208 JUMP_BACKWARD           14 (to 182)
        >>  210 END_FOR
            212 STORE_FAST              10 (filtered_data)
            214 STORE_FAST               9 (d)

842         216 LOAD_GLOBAL              7 (NULL + range)
            226 LOAD_GLOBAL              8 (TOTAL_DATA_AMOUNT)
            236 CALL                     1
            244 GET_ITER
        >>  246 FOR_ITER               186 (to 622)
            250 STORE_FAST              11 (i)

844         252 LOAD_FAST               10 (filtered_data)
            254 POP_JUMP_IF_TRUE         2 (to 260)

845         256 POP_TOP
            258 JUMP_FORWARD           182 (to 624)

848     >>  260 LOAD_FAST               11 (i)
            262 LOAD_GLOBAL             10 (HARD_DATA_AMOUNT)
            272 COMPARE_OP               2 (<)
            276 POP_JUMP_IF_FALSE        3 (to 284)

849         278 LOAD_CONST               6 ('Hard')
            280 STORE_FAST              12 (difficulty)
            282 JUMP_FORWARD            21 (to 326)

850     >>  284 LOAD_FAST               11 (i)
            286 LOAD_GLOBAL             10 (HARD_DATA_AMOUNT)
            296 LOAD_GLOBAL             12 (MEDIUM_DATA_AMOUNT)
            306 BINARY_OP                0 (+)
            310 COMPARE_OP               2 (<)
            314 POP_JUMP_IF_FALSE        3 (to 322)

851         316 LOAD_CONST               7 ('Medium')
            318 STORE_FAST              12 (difficulty)
            320 JUMP_FORWARD             2 (to 326)

853     >>  322 LOAD_CONST               8 ('Easy')
            324 STORE_FAST              12 (difficulty)

856     >>  326 LOAD_GLOBAL             15 (NULL + random)
            336 LOAD_ATTR               16 (randint)
            356 LOAD_CONST               2 (0)
            358 LOAD_GLOBAL             19 (NULL + len)
            368 LOAD_FAST               10 (filtered_data)
            370 CALL                     1
            378 LOAD_CONST               5 (1)
            380 BINARY_OP               10 (-)
            384 CALL                     2
            392 STORE_FAST              13 (selected_data_index)

857         394 LOAD_FAST               10 (filtered_data)
            396 LOAD_FAST               13 (selected_data_index)
            398 BINARY_SUBSCR
            402 STORE_FAST              14 (selected_data)

860         404 LOAD_FAST               14 (selected_data)
            406 LOAD_FAST                3 (dataset)
            408 CONTAINS_OP              1
            410 POP_JUMP_IF_TRUE         1 (to 414)
            412 JUMP_BACKWARD           84 (to 246)
        >>  414 LOAD_FAST               14 (selected_data)
            416 LOAD_CONST               9 (2)
            418 BINARY_SUBSCR
            422 LOAD_FAST               12 (difficulty)
            424 COMPARE_OP              40 (==)
            428 POP_JUMP_IF_TRUE         1 (to 432)
            430 JUMP_BACKWARD           93 (to 246)

862     >>  432 LOAD_FAST                3 (dataset)
            434 LOAD_ATTR               21 (NULL|self + append)
            454 LOAD_FAST               14 (selected_data)
            456 CALL                     1
            464 POP_TOP

863         466 LOAD_FAST                4 (total_points)
            468 LOAD_GLOBAL             23 (NULL + int)
            478 LOAD_FAST               14 (selected_data)
            480 LOAD_CONST              10 (3)
            482 BINARY_SUBSCR
            486 CALL                     1
            494 BINARY_OP               13 (+=)
            498 STORE_FAST               4 (total_points)

864         500 LOAD_FAST                6 (difficulty_counts)
            502 LOAD_FAST               14 (selected_data)
            504 LOAD_CONST               9 (2)
            506 BINARY_SUBSCR
            510 COPY                     2
            512 COPY                     2
            514 BINARY_SUBSCR
            518 LOAD_CONST               5 (1)
            520 BINARY_OP               13 (+=)
            524 SWAP                     3
            526 SWAP                     2
            528 STORE_SUBSCR

865         532 LOAD_FAST               10 (filtered_data)
            534 LOAD_ATTR               25 (NULL|self + pop)
            554 LOAD_FAST               13 (selected_data_index)
            556 CALL                     1
            564 POP_TOP

866         566 LOAD_FAST               14 (selected_data)
            568 LOAD_CONST               5 (1)
            570 BINARY_SUBSCR
            574 STORE_FAST              15 (title_value)

867         576 LOAD_FAST               15 (title_value)
            578 LOAD_FAST                5 (total_titles)
            580 CONTAINS_OP              1
            582 POP_JUMP_IF_TRUE         1 (to 586)
            584 JUMP_BACKWARD          170 (to 246)

868     >>  586 LOAD_FAST                5 (total_titles)
            588 LOAD_ATTR               21 (NULL|self + append)
            608 LOAD_FAST               15 (title_value)
            610 CALL                     1
            618 POP_TOP
            620 JUMP_BACKWARD          188 (to 246)

842     >>  622 END_FOR

871     >>  624 LOAD_GLOBAL             19 (NULL + len)
            634 LOAD_FAST                3 (dataset)
            636 CALL                     1
            644 LOAD_GLOBAL              8 (TOTAL_DATA_AMOUNT)
            654 COMPARE_OP              55 (!=)
            658 POP_JUMP_IF_FALSE        2 (to 664)

872         660 EXTENDED_ARG             1
            662 JUMP_BACKWARD          330 (to 4)

875     >>  664 LOAD_GLOBAL             27 (NULL + sum)
            674 LOAD_FAST                6 (difficulty_counts)
            676 LOAD_ATTR               29 (NULL|self + values)
            696 CALL                     0
            704 CALL                     1
            712 STORE_FAST              16 (total_difficulties)

876         714 LOAD_FAST               16 (total_difficulties)
            716 LOAD_CONST               2 (0)
            718 COMPARE_OP              40 (==)
            722 POP_JUMP_IF_FALSE        1 (to 726)

878         724 RETURN_CONST             1 (False)

882     >>  726 LOAD_FAST                6 (difficulty_counts)
            728 LOAD_ATTR               31 (NULL|self + items)
            748 CALL                     0

880         756 GET_ITER
            758 LOAD_FAST_AND_CLEAR     17 (k)
            760 LOAD_FAST_AND_CLEAR     18 (v)
            762 SWAP                     3
            764 BUILD_MAP                0
            766 SWAP                     2
        >>  768 FOR_ITER                14 (to 800)

882         772 UNPACK_SEQUENCE          2
            776 STORE_FAST              17 (k)
            778 STORE_FAST              18 (v)

881         780 LOAD_FAST               17 (k)
            782 LOAD_FAST               18 (v)
            784 LOAD_FAST               16 (total_difficulties)
            786 BINARY_OP               11 (/)
            790 LOAD_CONST              11 (100)
            792 BINARY_OP                5 (*)
            796 MAP_ADD                  2
            798 JUMP_BACKWARD           16 (to 768)

880     >>  800 END_FOR
            802 STORE_FAST              19 (difficulty_ratios)
            804 STORE_FAST              17 (k)
            806 STORE_FAST              18 (v)

886         808 LOAD_FAST                4 (total_points)
            810 LOAD_GLOBAL             32 (TOTAL_POINTS)
            820 COMPARE_OP              55 (!=)
            824 POP_JUMP_IF_FALSE        2 (to 830)

887         826 EXTENDED_ARG             1
            828 JUMP_BACKWARD          413 (to 4)

888     >>  830 LOAD_GLOBAL             19 (NULL + len)
            840 LOAD_FAST                5 (total_titles)
            842 CALL                     1
            850 LOAD_GLOBAL             34 (MINIMUM_TYPES)
            860 COMPARE_OP               2 (<)
            864 POP_JUMP_IF_FALSE        2 (to 870)

889         866 EXTENDED_ARG             1
            868 JUMP_BACKWARD          433 (to 4)

892     >>  870 NOP

895         872 LOAD_FAST                3 (dataset)
            874 LOAD_FAST                4 (total_points)
            876 LOAD_FAST               19 (difficulty_ratios)
            878 LOAD_FAST                5 (total_titles)
            880 BUILD_TUPLE              4
            882 RETURN_VALUE
        >>  884 SWAP                     2
            886 POP_TOP

834         888 SWAP                     2
            890 STORE_FAST               7 (title)
            892 RERAISE                  0
        >>  894 SWAP                     2
            896 POP_TOP

839         898 SWAP                     2
            900 STORE_FAST               9 (d)
            902 RERAISE                  0
        >>  904 SWAP                     2
            906 POP_TOP

880         908 SWAP                     3
            910 STORE_FAST              18 (v)
            912 STORE_FAST              17 (k)
            914 RERAISE                  0
        >>  916 PUSH_EXC_INFO

896         918 LOAD_GLOBAL             36 (Exception)
            928 CHECK_EXC_MATCH
            930 POP_JUMP_IF_FALSE       34 (to 1000)
            932 STORE_FAST              20 (e)

898         934 LOAD_GLOBAL             38 (log)
            944 LOAD_ATTR               41 (NULL|self + error)
            964 LOAD_CONST              12 ('Unexpected error: ')
            966 LOAD_FAST               20 (e)
            968 FORMAT_VALUE             0
            970 BUILD_STRING             2
            972 CALL                     1
            980 POP_TOP

899         982 POP_EXCEPT
            984 LOAD_CONST              13 (None)
            986 STORE_FAST              20 (e)
            988 DELETE_FAST             20 (e)
            990 RETURN_CONST             1 (False)
        >>  992 LOAD_CONST              13 (None)
            994 STORE_FAST              20 (e)
            996 DELETE_FAST             20 (e)
            998 RERAISE                  1

896     >> 1000 RERAISE                  0
        >> 1002 COPY                     3
           1004 POP_EXCEPT
           1006 RERAISE                  1
ExceptionTable:
  4 to 48 -> 916 [0]
  52 to 118 -> 916 [0]
  120 to 164 -> 884 [2]
  166 to 176 -> 916 [0]
  178 to 200 -> 894 [2]
  204 to 210 -> 894 [2]
  212 to 410 -> 916 [0]
  414 to 428 -> 916 [0]
  432 to 582 -> 916 [0]
  586 to 722 -> 916 [0]
  726 to 762 -> 916 [0]
  764 to 800 -> 904 [3]
  802 to 880 -> 916 [0]
  884 to 914 -> 916 [0]
  916 to 932 -> 1002 [1] lasti
  934 to 980 -> 992 [1] lasti
  992 to 1000 -> 1002 [1] lasti

Disassembly of <code object __create_excel at 0x5b2878ac62f0, file "example.py", line 901>:
901           0 RESUME                   0

909           2 NOP

911           4 BUILD_LIST               0
              6 STORE_FAST               0 (data)

914           8 LOAD_GLOBAL              0 (DEBUG_DB)
             18 POP_JUMP_IF_FALSE        5 (to 30)

915          20 BUILD_LIST               0
             22 LOAD_CONST               1 (('Data', 'Type', 'Range', 'Weight'))
             24 LIST_EXTEND              1
             26 STORE_FAST               1 (headers)
             28 JUMP_FORWARD             4 (to 38)

917     >>   30 LOAD_CONST               2 ('Data')
             32 LOAD_CONST               3 ('Weight')
             34 BUILD_LIST               2
             36 STORE_FAST               1 (headers)

920     >>   38 LOAD_GLOBAL              3 (NULL + open)
             48 LOAD_CONST               4 ('Exam.txt')
             50 LOAD_CONST               5 ('r')
             52 CALL                     2
             60 BEFORE_WITH
             62 STORE_FAST               2 (file)

921          64 LOAD_FAST                2 (file)
             66 LOAD_ATTR                5 (NULL|self + readlines)
             86 CALL                     0
             94 STORE_FAST               3 (lines)

924          96 LOAD_GLOBAL              7 (NULL + enumerate)
            106 LOAD_FAST                3 (lines)
            108 CALL                     1
            116 GET_ITER
        >>  118 FOR_ITER               122 (to 366)
            122 UNPACK_SEQUENCE          2
            126 STORE_FAST               4 (i)
            128 STORE_FAST               5 (line)

925         130 LOAD_FAST                4 (i)
            132 LOAD_CONST               6 (2)
            134 BINARY_OP                6 (%)
            138 LOAD_CONST               7 (0)
            140 COMPARE_OP              55 (!=)
            144 POP_JUMP_IF_FALSE        1 (to 148)

926         146 JUMP_BACKWARD           15 (to 118)

928     >>  148 LOAD_FAST                5 (line)
            150 LOAD_ATTR                9 (NULL|self + strip)
            170 CALL                     0
            178 LOAD_ATTR               11 (NULL|self + split)
            198 LOAD_CONST               8 ('&')
            200 CALL                     1
            208 STORE_FAST               6 (parts)

931         210 LOAD_GLOBAL              0 (DEBUG_DB)
            220 POP_JUMP_IF_FALSE       32 (to 286)
            222 LOAD_GLOBAL             13 (NULL + len)
            232 LOAD_FAST                6 (parts)
            234 CALL                     1
            242 LOAD_CONST               9 (5)
            244 COMPARE_OP              40 (==)
            248 POP_JUMP_IF_FALSE       18 (to 286)

932         250 LOAD_FAST                0 (data)
            252 LOAD_ATTR               15 (NULL|self + append)
            272 LOAD_FAST                6 (parts)
            274 CALL                     1
            282 POP_TOP
            284 JUMP_BACKWARD           84 (to 118)

933     >>  286 LOAD_GLOBAL              0 (DEBUG_DB)
            296 POP_JUMP_IF_FALSE        1 (to 300)
            298 JUMP_BACKWARD           91 (to 118)
        >>  300 LOAD_GLOBAL             13 (NULL + len)
            310 LOAD_FAST                6 (parts)
            312 CALL                     1
            320 LOAD_CONST              10 (3)
            322 COMPARE_OP              40 (==)
            326 POP_JUMP_IF_TRUE         1 (to 330)
            328 JUMP_BACKWARD          106 (to 118)

934     >>  330 LOAD_FAST                0 (data)
            332 LOAD_ATTR               15 (NULL|self + append)
            352 LOAD_FAST                6 (parts)
            354 CALL                     1
            362 POP_TOP
            364 JUMP_BACKWARD          124 (to 118)

924     >>  366 END_FOR
            368 NOP

920         370 LOAD_CONST              11 (None)
            372 LOAD_CONST              11 (None)
            374 LOAD_CONST              11 (None)
            376 CALL                     2
            384 POP_TOP

937     >>  386 LOAD_GLOBAL             17 (NULL + pd)
            396 LOAD_ATTR               18 (DataFrame)
            416 LOAD_FAST                0 (data)
            418 LOAD_FAST                1 (headers)
            420 KW_NAMES                12 (('columns',))
            422 CALL                     2
            430 STORE_FAST               7 (df)

940         432 LOAD_FAST                7 (df)
            434 LOAD_ATTR               21 (NULL|self + to_excel)
            454 LOAD_CONST              13 ('Data.xlsx')
            456 LOAD_CONST              14 (False)
            458 KW_NAMES                15 (('index',))
            460 CALL                     2
            468 POP_TOP

943         470 LOAD_GLOBAL             23 (NULL + os)
            480 LOAD_ATTR               24 (remove)
            500 LOAD_CONST               4 ('Exam.txt')
            502 CALL                     1
            510 POP_TOP

945         512 RETURN_CONST            16 (True)

920     >>  514 PUSH_EXC_INFO
            516 WITH_EXCEPT_START
            518 POP_JUMP_IF_TRUE         1 (to 522)
            520 RERAISE                  2
        >>  522 POP_TOP
            524 POP_EXCEPT
            526 POP_TOP
            528 POP_TOP
            530 JUMP_BACKWARD           73 (to 386)
        >>  532 COPY                     3
            534 POP_EXCEPT
            536 RERAISE                  1
        >>  538 PUSH_EXC_INFO

946         540 LOAD_GLOBAL             26 (FileExistsError)
            550 CHECK_EXC_MATCH
            552 POP_JUMP_IF_FALSE       34 (to 622)
            554 STORE_FAST               8 (fnfe)

948         556 LOAD_GLOBAL             28 (log)
            566 LOAD_ATTR               31 (NULL|self + critical)
            586 LOAD_CONST              17 ('File not found: ')
            588 LOAD_FAST                8 (fnfe)
            590 FORMAT_VALUE             0
            592 BUILD_STRING             2
            594 CALL                     1
            602 POP_TOP

949         604 POP_EXCEPT
            606 LOAD_CONST              11 (None)
            608 STORE_FAST               8 (fnfe)
            610 DELETE_FAST              8 (fnfe)
            612 RETURN_CONST            14 (False)
        >>  614 LOAD_CONST              11 (None)
            616 STORE_FAST               8 (fnfe)
            618 DELETE_FAST              8 (fnfe)
            620 RERAISE                  1

950     >>  622 LOAD_GLOBAL             32 (Exception)
            632 CHECK_EXC_MATCH
            634 POP_JUMP_IF_FALSE       34 (to 704)
            636 STORE_FAST               9 (e)

952         638 LOAD_GLOBAL             28 (log)
            648 LOAD_ATTR               35 (NULL|self + error)
            668 LOAD_CONST              18 ('Unexpected error: ')
            670 LOAD_FAST                9 (e)
            672 FORMAT_VALUE             0
            674 BUILD_STRING             2
            676 CALL                     1
            684 POP_TOP

953         686 POP_EXCEPT
            688 LOAD_CONST              11 (None)
            690 STORE_FAST               9 (e)
            692 DELETE_FAST              9 (e)
            694 RETURN_CONST            14 (False)
        >>  696 LOAD_CONST              11 (None)
            698 STORE_FAST               9 (e)
            700 DELETE_FAST              9 (e)
            702 RERAISE                  1

950     >>  704 RERAISE                  0
        >>  706 COPY                     3
            708 POP_EXCEPT
            710 RERAISE                  1
ExceptionTable:
  4 to 60 -> 538 [0]
  62 to 296 -> 514 [1] lasti
  300 to 326 -> 514 [1] lasti
  330 to 366 -> 514 [1] lasti
  370 to 510 -> 538 [0]
  514 to 522 -> 532 [3] lasti
  524 to 536 -> 538 [0]
  538 to 554 -> 706 [1] lasti
  556 to 602 -> 614 [1] lasti
  614 to 636 -> 706 [1] lasti
  638 to 684 -> 696 [1] lasti
  696 to 704 -> 706 [1] lasti

Disassembly of <code object __common at 0x5b2878a448a0, file "example.py", line 955>:
 955           0 RESUME                   0

 966           2 BUILD_LIST               0
               4 LOAD_CONST               1 (('password', 'qwertyuiop', '12345678', '123456789', '1234567890', 'qwerty', 'password', '11111111', '123454321', 'abcd?1234', 'qwer!5678', 'football', 'springfield', 'jessica', 'jennifer', 'princess', 'superman', 'iloveyou', 'babygirl', 'trustno1', 'computer', 'p@ssw0rd', 'qwe123456', 'qweasd123', 'qwe123asd', '123qweasd', 'p@ssword', '123qweasd', '123qwe123', '1q2w3e', '1q2w3e4r', '1q2w3e4r5t', '1q2w3e4r5t6y', 'qwertyui', 'asdfghjk', 'asdfghjkl', 'passw0rd'))
               6 LIST_EXTEND              1
               8 STORE_FAST               1 (common)

1005          10 LOAD_FAST                0 (password)
              12 LOAD_ATTR                1 (NULL|self + upper)
              32 CALL                     0
              40 LOAD_FAST                1 (common)
              42 CONTAINS_OP              0
              44 POP_JUMP_IF_FALSE        1 (to 48)

1006          46 RETURN_CONST             2 (True)

1007     >>   48 LOAD_FAST                0 (password)
              50 LOAD_ATTR                3 (NULL|self + lower)
              70 CALL                     0
              78 LOAD_FAST                1 (common)
              80 CONTAINS_OP              0
              82 POP_JUMP_IF_FALSE        1 (to 86)

1008          84 RETURN_CONST             2 (True)

1009     >>   86 RETURN_CONST             3 (False)

Disassembly of <code object __exam_generator at 0x5b2878a6c270, file "example.py", line 1011>:
1011           0 RESUME                   0

1023           2 LOAD_FAST                0 (self)
               4 LOAD_ATTR                1 (NULL|self + _DATABASE__read_csv)
              24 CALL                     0
              32 STORE_FAST               2 (data)

1024          34 LOAD_FAST                2 (data)
              36 LOAD_CONST               1 (False)
              38 IS_OP                    0
              40 POP_JUMP_IF_FALSE        1 (to 44)

1026          42 RETURN_CONST             1 (False)

1028     >>   44 NOP

1030          46 LOAD_GLOBAL              2 (sql)
              56 LOAD_ATTR                5 (NULL|self + get_excluded_titles)
              76 LOAD_FAST                1 (username)
              78 CALL                     1
              86 STORE_FAST               3 (Exclude_list)

1031          88 LOAD_FAST                3 (Exclude_list)
              90 LOAD_CONST               1 (False)
              92 IS_OP                    0
              94 POP_JUMP_IF_FALSE        1 (to 98)

1033          96 RETURN_CONST             1 (False)

1036     >>   98 LOAD_FAST                0 (self)
             100 LOAD_ATTR                7 (NULL|self + _DATABASE__generate_data)
             120 LOAD_FAST                2 (data)
             122 LOAD_FAST                3 (Exclude_list)
             124 CALL                     2
             132 STORE_FAST               4 (temp)

1037         134 LOAD_FAST                4 (temp)
             136 LOAD_CONST               1 (False)
             138 IS_OP                    0
             140 POP_JUMP_IF_FALSE        1 (to 144)

1039         142 RETURN_CONST             1 (False)

1042     >>  144 LOAD_FAST                4 (temp)
             146 UNPACK_SEQUENCE          4
             150 STORE_FAST               5 (dataset)
             152 STORE_FAST               6 (total_points)
             154 STORE_FAST               7 (difficulty_ratios)
             156 STORE_FAST               8 (total_titles)

1045         158 LOAD_GLOBAL              8 (os)
             168 LOAD_ATTR               10 (path)
             188 LOAD_ATTR               13 (NULL|self + exists)
             208 LOAD_CONST               2 ('Exam.txt')
             210 CALL                     1
             218 POP_JUMP_IF_FALSE       21 (to 262)

1046         220 LOAD_GLOBAL              9 (NULL + os)
             230 LOAD_ATTR               14 (remove)
             250 LOAD_CONST               2 ('Exam.txt')
             252 CALL                     1
             260 POP_TOP

1049     >>  262 LOAD_GLOBAL             17 (NULL + open)
             272 LOAD_CONST               2 ('Exam.txt')
             274 LOAD_CONST               3 ('w')
             276 CALL                     2
             284 BEFORE_WITH
             286 STORE_FAST               9 (file)

1051         288 LOAD_GLOBAL             18 (DEBUG_DB)
             298 POP_JUMP_IF_FALSE      119 (to 538)

1053         300 LOAD_FAST                9 (file)
             302 LOAD_ATTR               21 (NULL|self + write)
             322 LOAD_CONST               4 ('Debug mode is on.\n\n')
             324 CALL                     1
             332 POP_TOP

1055         334 LOAD_FAST                5 (dataset)
             336 GET_ITER
         >>  338 FOR_ITER                96 (to 534)
             342 STORE_FAST              10 (sublist)

1056         344 LOAD_FAST                9 (file)
             346 LOAD_ATTR               21 (NULL|self + write)

1057         366 LOAD_FAST               10 (sublist)
             368 LOAD_CONST               5 (4)
             370 BINARY_SUBSCR
             374 FORMAT_VALUE             0
             376 LOAD_CONST               6 (' & ')
             378 LOAD_FAST               10 (sublist)
             380 LOAD_CONST               7 (0)
             382 BINARY_SUBSCR
             386 FORMAT_VALUE             0
             388 LOAD_CONST               8 (' & Type: ')
             390 LOAD_FAST               10 (sublist)
             392 LOAD_CONST               9 (1)
             394 BINARY_SUBSCR
             398 FORMAT_VALUE             0
             400 LOAD_CONST              10 (' & Difficulty: ')
             402 LOAD_FAST               10 (sublist)
             404 LOAD_CONST              11 (2)
             406 BINARY_SUBSCR
             410 FORMAT_VALUE             0
             412 LOAD_CONST              12 (' & [')
             414 LOAD_FAST               10 (sublist)
             416 LOAD_CONST              13 (3)
             418 BINARY_SUBSCR
             422 FORMAT_VALUE             0
             424 LOAD_CONST              14 (']\n')
             426 BUILD_STRING            10

1056         428 CALL                     1
             436 POP_TOP

1059         438 LOAD_FAST                9 (file)
             440 LOAD_ATTR               21 (NULL|self + write)

1060         460 LOAD_FAST               10 (sublist)
             462 LOAD_CONST               5 (4)
             464 BINARY_SUBSCR
             468 FORMAT_VALUE             0
             470 LOAD_CONST               6 (' & ')
             472 LOAD_FAST               10 (sublist)
             474 LOAD_CONST               7 (0)
             476 BINARY_SUBSCR
             480 FORMAT_VALUE             0
             482 LOAD_CONST               8 (' & Type: ')
             484 LOAD_FAST               10 (sublist)
             486 LOAD_CONST               9 (1)
             488 BINARY_SUBSCR
             492 FORMAT_VALUE             0
             494 LOAD_CONST              10 (' & Difficulty: ')
             496 LOAD_FAST               10 (sublist)
             498 LOAD_CONST              11 (2)
             500 BINARY_SUBSCR
             504 FORMAT_VALUE             0
             506 LOAD_CONST              12 (' & [')
             508 LOAD_FAST               10 (sublist)
             510 LOAD_CONST              13 (3)
             512 BINARY_SUBSCR
             516 FORMAT_VALUE             0
             518 LOAD_CONST              14 (']\n')
             520 BUILD_STRING            10

1059         522 CALL                     1
             530 POP_TOP
             532 JUMP_BACKWARD           98 (to 338)

1055     >>  534 END_FOR
             536 JUMP_FORWARD            77 (to 692)

1064     >>  538 LOAD_FAST                5 (dataset)
             540 GET_ITER
         >>  542 FOR_ITER                72 (to 690)
             546 STORE_FAST              10 (sublist)

1065         548 LOAD_FAST                9 (file)
             550 LOAD_ATTR               21 (NULL|self + write)
             570 LOAD_FAST               10 (sublist)
             572 LOAD_CONST               5 (4)
             574 BINARY_SUBSCR
             578 FORMAT_VALUE             0
             580 LOAD_CONST               6 (' & ')
             582 LOAD_FAST               10 (sublist)
             584 LOAD_CONST               7 (0)
             586 BINARY_SUBSCR
             590 FORMAT_VALUE             0
             592 LOAD_CONST              12 (' & [')
             594 LOAD_FAST               10 (sublist)
             596 LOAD_CONST              13 (3)
             598 BINARY_SUBSCR
             602 FORMAT_VALUE             0
             604 LOAD_CONST              14 (']\n')
             606 BUILD_STRING             6
             608 CALL                     1
             616 POP_TOP

1066         618 LOAD_FAST                9 (file)
             620 LOAD_ATTR               21 (NULL|self + write)
             640 LOAD_FAST               10 (sublist)
             642 LOAD_CONST               5 (4)
             644 BINARY_SUBSCR
             648 FORMAT_VALUE             0
             650 LOAD_CONST               6 (' & ')
             652 LOAD_FAST               10 (sublist)
             654 LOAD_CONST               7 (0)
             656 BINARY_SUBSCR
             660 FORMAT_VALUE             0
             662 LOAD_CONST              12 (' & [')
             664 LOAD_FAST               10 (sublist)
             666 LOAD_CONST              13 (3)
             668 BINARY_SUBSCR
             672 FORMAT_VALUE             0
             674 LOAD_CONST              14 (']\n')
             676 BUILD_STRING             6
             678 CALL                     1
             686 POP_TOP
             688 JUMP_BACKWARD           74 (to 542)

1064     >>  690 END_FOR

1069     >>  692 LOAD_FAST                9 (file)
             694 LOAD_ATTR               21 (NULL|self + write)
             714 LOAD_CONST              15 ('\n\nTotal dataset is out of ')
             716 LOAD_GLOBAL             22 (TOTAL_POINTS)
             726 FORMAT_VALUE             0
             728 LOAD_CONST              16 (' points.')
             730 BUILD_STRING             3
             732 CALL                     1
             740 POP_TOP

1049         742 LOAD_CONST              17 (None)
             744 LOAD_CONST              17 (None)
             746 LOAD_CONST              17 (None)
             748 CALL                     2
             756 POP_TOP

1072     >>  758 LOAD_GLOBAL             25 (NULL + time)
             768 LOAD_ATTR               26 (sleep)
             788 LOAD_CONST               9 (1)
             790 CALL                     1
             798 POP_TOP

1075         800 LOAD_FAST                0 (self)
             802 LOAD_ATTR               29 (NULL|self + _DATABASE__create_excel)
             822 CALL                     0
             830 STORE_FAST              11 (msg)

1076         832 LOAD_FAST               11 (msg)
             834 LOAD_CONST               1 (False)
             836 IS_OP                    0
             838 POP_JUMP_IF_FALSE        1 (to 842)

1078         840 RETURN_CONST             1 (False)

1081     >>  842 LOAD_GLOBAL             30 (log)
             852 LOAD_ATTR               33 (NULL|self + info)
             872 LOAD_CONST              18 ('Dataset Generated and saved to Data.xlsx')
             874 CALL                     1
             882 POP_TOP

1082         884 LOAD_GLOBAL             35 (NULL + print)
             894 LOAD_CONST              19 ('Dataset Generation information:')
             896 CALL                     1
             904 POP_TOP

1083         906 LOAD_GLOBAL             35 (NULL + print)
             916 LOAD_CONST              20 ('Total Points in dataset: ')
             918 LOAD_FAST                6 (total_points)
             920 FORMAT_VALUE             0
             922 BUILD_STRING             2
             924 CALL                     1
             932 POP_TOP

1084         934 LOAD_GLOBAL             35 (NULL + print)
             944 LOAD_CONST              21 ('Number of Data Included in dataset: ')
             946 LOAD_GLOBAL             37 (NULL + len)
             956 LOAD_FAST                5 (dataset)
             958 CALL                     1
             966 FORMAT_VALUE             0
             968 BUILD_STRING             2
             970 CALL                     1
             978 POP_TOP

1085         980 LOAD_GLOBAL             35 (NULL + print)
             990 LOAD_CONST              22 ('Total Titles Used in dataset: ')
             992 LOAD_GLOBAL             37 (NULL + len)
            1002 LOAD_FAST                8 (total_titles)
            1004 CALL                     1
            1012 FORMAT_VALUE             0
            1014 BUILD_STRING             2
            1016 CALL                     1
            1024 POP_TOP

1086        1026 LOAD_GLOBAL             35 (NULL + print)

1087        1036 LOAD_CONST              23 ('Difficulty Ratio used: Hard: ')
            1038 LOAD_GLOBAL             39 (NULL + round)
            1048 LOAD_FAST                7 (difficulty_ratios)
            1050 LOAD_CONST              24 ('Hard')
            1052 BINARY_SUBSCR
            1056 LOAD_CONST              11 (2)
            1058 CALL                     2
            1066 FORMAT_VALUE             0
            1068 LOAD_CONST              25 ('%, Medium: ')
            1070 LOAD_GLOBAL             39 (NULL + round)
            1080 LOAD_FAST                7 (difficulty_ratios)
            1082 LOAD_CONST              26 ('Medium')
            1084 BINARY_SUBSCR
            1088 LOAD_CONST              11 (2)
            1090 CALL                     2
            1098 FORMAT_VALUE             0
            1100 LOAD_CONST              27 ('%, Easy: ')
            1102 LOAD_GLOBAL             39 (NULL + round)
            1112 LOAD_FAST                7 (difficulty_ratios)
            1114 LOAD_CONST              28 ('Easy')
            1116 BINARY_SUBSCR
            1120 LOAD_CONST              11 (2)
            1122 CALL                     2
            1130 FORMAT_VALUE             0
            1132 LOAD_CONST              29 ('%')
            1134 BUILD_STRING             7

1086        1136 CALL                     1
            1144 POP_TOP

1089        1146 RETURN_CONST            30 (True)

1049     >> 1148 PUSH_EXC_INFO
            1150 WITH_EXCEPT_START
            1152 POP_JUMP_IF_TRUE         1 (to 1156)
            1154 RERAISE                  2
         >> 1156 POP_TOP
            1158 POP_EXCEPT
            1160 POP_TOP
            1162 POP_TOP
            1164 JUMP_BACKWARD          204 (to 758)
         >> 1166 COPY                     3
            1168 POP_EXCEPT
            1170 RERAISE                  1
         >> 1172 PUSH_EXC_INFO

1090        1174 LOAD_GLOBAL             40 (Exception)
            1184 CHECK_EXC_MATCH
            1186 POP_JUMP_IF_FALSE       34 (to 1256)
            1188 STORE_FAST              12 (e)

1092        1190 LOAD_GLOBAL             30 (log)
            1200 LOAD_ATTR               43 (NULL|self + error)
            1220 LOAD_CONST              31 ('Unexpected error: ')
            1222 LOAD_FAST               12 (e)
            1224 FORMAT_VALUE             0
            1226 BUILD_STRING             2
            1228 CALL                     1
            1236 POP_TOP

1093        1238 POP_EXCEPT
            1240 LOAD_CONST              17 (None)
            1242 STORE_FAST              12 (e)
            1244 DELETE_FAST             12 (e)
            1246 RETURN_CONST             1 (False)
         >> 1248 LOAD_CONST              17 (None)
            1250 STORE_FAST              12 (e)
            1252 DELETE_FAST             12 (e)
            1254 RERAISE                  1

1090     >> 1256 RERAISE                  0
         >> 1258 COPY                     3
            1260 POP_EXCEPT
            1262 RERAISE                  1
ExceptionTable:
  46 to 94 -> 1172 [0]
  98 to 140 -> 1172 [0]
  144 to 284 -> 1172 [0]
  286 to 740 -> 1148 [1] lasti
  742 to 838 -> 1172 [0]
  842 to 1144 -> 1172 [0]
  1148 to 1156 -> 1166 [3] lasti
  1158 to 1170 -> 1172 [0]
  1172 to 1188 -> 1258 [1] lasti
  1190 to 1236 -> 1248 [1] lasti
  1248 to 1256 -> 1258 [1] lasti

Disassembly of <code object api at 0x5b2878ada1c0, file "example.py", line 1095>:
1095           0 RESUME                   0

1102           2 NOP

1104           4 LOAD_FAST                0 (self)
               6 LOAD_ATTR                1 (NULL|self + _DATABASE__read_config)
              26 CALL                     0
              34 STORE_FAST               1 (config_data)

1107          36 LOAD_FAST                1 (config_data)
              38 LOAD_CONST               1 (False)
              40 IS_OP                    0
              42 POP_JUMP_IF_FALSE       28 (to 100)

1108          44 LOAD_FAST                0 (self)
              46 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
              66 LOAD_CONST               2 ('CCD')
              68 CALL                     1
              76 POP_TOP

1109          78 LOAD_GLOBAL              5 (NULL + exit)
              88 LOAD_CONST               3 ('Failed to read config file')
              90 CALL                     1
              98 POP_TOP

1125     >>  100 LOAD_FAST                1 (config_data)

1113         102 UNPACK_SEQUENCE         11

1114         106 STORE_GLOBAL             3 (TOTAL_DATA_AMOUNT)

1115         108 STORE_GLOBAL             4 (MINIMUM_TYPES)

1116         110 STORE_GLOBAL             5 (HARD_DATA_AMOUNT)

1117         112 STORE_GLOBAL             6 (MEDIUM_DATA_AMOUNT)

1118         114 STORE_GLOBAL             7 (EASY_DATA_AMOUNT)

1119         116 STORE_GLOBAL             8 (TOTAL_POINTS)

1120         118 STORE_GLOBAL             9 (DEBUG_DB)

1121         120 STORE_FAST               2 (API)

1122         122 STORE_FAST               3 (USERNAME)

1123         124 STORE_FAST               4 (PASSWORD)

1124         126 STORE_FAST               5 (EXCLUDE)

1128         128 LOAD_FAST                2 (API)
             130 LOAD_CONST               4 ('REC')
             132 COMPARE_OP              40 (==)
             136 POP_JUMP_IF_FALSE      163 (to 464)

1130         138 LOAD_GLOBAL             20 (log)
             148 LOAD_ATTR               23 (NULL|self + info)

1131         168 LOAD_CONST               5 ('A request has been made to generate an exam by the user ')
             170 LOAD_FAST                3 (USERNAME)
             172 FORMAT_VALUE             0
             174 BUILD_STRING             2

1130         176 CALL                     1
             184 POP_TOP

1133         186 LOAD_GLOBAL             24 (sql)
             196 LOAD_ATTR               27 (NULL|self + verify_password)
             216 LOAD_FAST                3 (USERNAME)
             218 LOAD_FAST                4 (PASSWORD)
             220 CALL                     2
             228 POP_JUMP_IF_FALSE       78 (to 386)

1135         230 LOAD_FAST                0 (self)
             232 LOAD_ATTR               29 (NULL|self + _DATABASE__exam_generator)
             252 LOAD_FAST                3 (USERNAME)
             254 CALL                     1
             262 POP_JUMP_IF_FALSE       22 (to 308)

1136         264 LOAD_GLOBAL             20 (log)
             274 LOAD_ATTR               23 (NULL|self + info)
             294 LOAD_CONST               6 ('Dataset generated successfully based on the request')
             296 CALL                     1
             304 POP_TOP
             306 RETURN_CONST            14 (None)

1138     >>  308 LOAD_GLOBAL             20 (log)
             318 LOAD_ATTR               31 (NULL|self + error)
             338 LOAD_CONST               7 ('Failed to generate exam')
             340 CALL                     1
             348 POP_TOP

1139         350 LOAD_FAST                0 (self)
             352 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
             372 LOAD_CONST               8 ('UKF')
             374 CALL                     1
             382 POP_TOP
             384 RETURN_CONST            14 (None)

1141     >>  386 LOAD_FAST                0 (self)
             388 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
             408 LOAD_CONST               9 ('IC')
             410 CALL                     1
             418 POP_TOP

1142         420 LOAD_GLOBAL             20 (log)
             430 LOAD_ATTR               31 (NULL|self + error)
             450 LOAD_CONST              10 ('Wrong password given')
             452 CALL                     1
             460 POP_TOP
             462 RETURN_CONST            14 (None)

1144     >>  464 LOAD_FAST                2 (API)
             466 LOAD_CONST              11 ('RUC')
             468 COMPARE_OP              40 (==)
             472 EXTENDED_ARG             1
             474 POP_JUMP_IF_FALSE      359 (to 1194)

1146         476 LOAD_CONST              12 ('^[a-zA-Z ]{3,30}$')
             478 STORE_FAST               6 (username_regex)

1147         480 LOAD_CONST              13 ('^[a-zA-Z0-9 _!?]{8,36}$')
             482 STORE_FAST               7 (password_regex)

1148         484 LOAD_FAST                4 (PASSWORD)
             486 POP_JUMP_IF_NONE         2 (to 492)
             488 LOAD_FAST                3 (USERNAME)
             490 POP_JUMP_IF_NOT_NONE    39 (to 570)

1149     >>  492 LOAD_FAST                0 (self)
             494 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
             514 LOAD_CONST              15 ('CNU')
             516 CALL                     1
             524 POP_TOP

1150         526 LOAD_GLOBAL             20 (log)
             536 LOAD_ATTR               33 (NULL|self + critical)
             556 LOAD_CONST              16 ('Missing username or password')
             558 CALL                     1
             566 POP_TOP
             568 RETURN_CONST            14 (None)

1153     >>  570 LOAD_GLOBAL             35 (NULL + re)
             580 LOAD_ATTR               36 (match)
             600 LOAD_FAST                6 (username_regex)
             602 LOAD_FAST                3 (USERNAME)
             604 CALL                     2
             612 POP_JUMP_IF_FALSE      251 (to 1116)

1154         614 LOAD_GLOBAL             35 (NULL + re)
             624 LOAD_ATTR               36 (match)
             644 LOAD_FAST                7 (password_regex)
             646 LOAD_FAST                4 (PASSWORD)
             648 CALL                     2
             656 POP_JUMP_IF_FALSE      190 (to 1038)

1155         658 LOAD_FAST                0 (self)
             660 LOAD_ATTR               39 (NULL|self + _DATABASE__common)
             680 LOAD_FAST                4 (PASSWORD)
             682 CALL                     1
             690 POP_JUMP_IF_TRUE       134 (to 960)
             692 LOAD_GLOBAL             24 (sql)
             702 LOAD_ATTR               41 (NULL|self + password_exists)

1156         722 LOAD_FAST                4 (PASSWORD)

1155         724 CALL                     1
             732 POP_JUMP_IF_TRUE       113 (to 960)

1158         734 LOAD_GLOBAL             20 (log)
             744 LOAD_ATTR               23 (NULL|self + info)

1159         764 LOAD_CONST              17 ('A request has been made to create a new user by the following username ')
             766 LOAD_FAST                3 (USERNAME)
             768 FORMAT_VALUE             0
             770 BUILD_STRING             2

1158         772 CALL                     1
             780 POP_TOP

1162         782 LOAD_GLOBAL             24 (sql)
             792 LOAD_ATTR               43 (NULL|self + add_db)
             812 LOAD_FAST                3 (USERNAME)
             814 LOAD_CONST              18 ('Title1')
             816 LOAD_CONST              19 ('Title2')
             818 BUILD_LIST               2
             820 LOAD_FAST                4 (PASSWORD)
             822 CALL                     3
             830 POP_JUMP_IF_FALSE       22 (to 876)

1163         832 LOAD_GLOBAL             20 (log)
             842 LOAD_ATTR               23 (NULL|self + info)

1164         862 LOAD_CONST              20 ('User created successfully based on the request')

1163         864 CALL                     1
             872 POP_TOP
             874 RETURN_CONST            14 (None)

1167     >>  876 LOAD_GLOBAL             20 (log)
             886 LOAD_ATTR               31 (NULL|self + error)
             906 LOAD_CONST              21 ('Failed to create user ')
             908 LOAD_FAST                3 (USERNAME)
             910 FORMAT_VALUE             0
             912 BUILD_STRING             2
             914 CALL                     1
             922 POP_TOP

1168         924 LOAD_FAST                0 (self)
             926 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
             946 LOAD_CONST               8 ('UKF')
             948 CALL                     1
             956 POP_TOP
             958 RETURN_CONST            14 (None)

1170     >>  960 LOAD_GLOBAL             20 (log)
             970 LOAD_ATTR               45 (NULL|self + warning)

1171         990 LOAD_CONST              22 ('Invalid password - Password is commonly used')

1170         992 CALL                     1
            1000 POP_TOP

1173        1002 LOAD_FAST                0 (self)
            1004 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1024 LOAD_CONST              23 ('CP')
            1026 CALL                     1
            1034 POP_TOP
            1036 RETURN_CONST            14 (None)

1175     >> 1038 LOAD_GLOBAL             20 (log)
            1048 LOAD_ATTR               45 (NULL|self + warning)

1176        1068 LOAD_CONST              24 ('Invalid password - Password must be between 8 and 36 characters and contain at least one special character')

1175        1070 CALL                     1
            1078 POP_TOP

1178        1080 LOAD_FAST                0 (self)
            1082 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1102 LOAD_CONST              25 ('RGXF')
            1104 CALL                     1
            1112 POP_TOP
            1114 RETURN_CONST            14 (None)

1180     >> 1116 LOAD_GLOBAL             20 (log)
            1126 LOAD_ATTR               45 (NULL|self + warning)

1181        1146 LOAD_CONST              26 ('Invalid username - Username must be between 3 and 30 characters and contain only letters and spaces')

1180        1148 CALL                     1
            1156 POP_TOP

1183        1158 LOAD_FAST                0 (self)
            1160 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1180 LOAD_CONST              25 ('RGXF')
            1182 CALL                     1
            1190 POP_TOP
            1192 RETURN_CONST            14 (None)

1185     >> 1194 LOAD_FAST                2 (API)
            1196 LOAD_CONST              27 ('RDU')
            1198 COMPARE_OP              40 (==)
            1202 POP_JUMP_IF_FALSE      171 (to 1546)

1186        1204 LOAD_GLOBAL             24 (sql)
            1214 LOAD_ATTR               27 (NULL|self + verify_password)
            1234 LOAD_FAST                3 (USERNAME)
            1236 LOAD_FAST                4 (PASSWORD)
            1238 CALL                     2
            1246 POP_JUMP_IF_FALSE      110 (to 1468)

1188        1248 LOAD_GLOBAL             20 (log)
            1258 LOAD_ATTR               23 (NULL|self + info)

1189        1278 LOAD_CONST              28 ('A request has been made to add the following exclusion titles ')
            1280 LOAD_FAST                5 (EXCLUDE)
            1282 FORMAT_VALUE             0
            1284 LOAD_CONST              29 (' to the database for user ')
            1286 LOAD_FAST                3 (USERNAME)
            1288 FORMAT_VALUE             0
            1290 BUILD_STRING             4

1188        1292 CALL                     1
            1300 POP_TOP

1192        1302 LOAD_GLOBAL             24 (sql)
            1312 LOAD_ATTR               47 (NULL|self + add_exclusion_db)
            1332 LOAD_FAST                3 (USERNAME)
            1334 LOAD_FAST                5 (EXCLUDE)
            1336 CALL                     2
            1344 POP_JUMP_IF_FALSE       22 (to 1390)

1193        1346 LOAD_GLOBAL             20 (log)
            1356 LOAD_ATTR               23 (NULL|self + info)

1194        1376 LOAD_CONST              30 ('Exclusion titles added successfully based on the request')

1193        1378 CALL                     1
            1386 POP_TOP
            1388 RETURN_CONST            14 (None)

1197     >> 1390 LOAD_GLOBAL             20 (log)
            1400 LOAD_ATTR               31 (NULL|self + error)
            1420 LOAD_CONST              31 ('Failed to add exclusion titles to database')
            1422 CALL                     1
            1430 POP_TOP

1198        1432 LOAD_FAST                0 (self)
            1434 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1454 LOAD_CONST               8 ('UKF')
            1456 CALL                     1
            1464 POP_TOP
            1466 RETURN_CONST            14 (None)

1200     >> 1468 LOAD_FAST                0 (self)
            1470 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1490 LOAD_CONST               9 ('IC')
            1492 CALL                     1
            1500 POP_TOP

1201        1502 LOAD_GLOBAL             20 (log)
            1512 LOAD_ATTR               31 (NULL|self + error)
            1532 LOAD_CONST              10 ('Wrong password given')
            1534 CALL                     1
            1542 POP_TOP
            1544 RETURN_CONST            14 (None)

1203     >> 1546 LOAD_FAST                2 (API)
            1548 LOAD_CONST              32 ('RUR')
            1550 COMPARE_OP              40 (==)
            1554 POP_JUMP_IF_FALSE      172 (to 1900)

1204        1556 LOAD_GLOBAL             24 (sql)
            1566 LOAD_ATTR               27 (NULL|self + verify_password)
            1586 LOAD_FAST                3 (USERNAME)
            1588 LOAD_FAST                4 (PASSWORD)
            1590 CALL                     2
            1598 POP_JUMP_IF_FALSE      111 (to 1822)

1206        1600 LOAD_GLOBAL             20 (log)
            1610 LOAD_ATTR               23 (NULL|self + info)

1207        1630 LOAD_CONST              33 ('A request has been made to remove the user ')
            1632 LOAD_FAST                3 (USERNAME)
            1634 FORMAT_VALUE             0
            1636 LOAD_CONST              34 (' from the database')
            1638 BUILD_STRING             3

1206        1640 CALL                     1
            1648 POP_TOP

1210        1650 LOAD_GLOBAL             24 (sql)
            1660 LOAD_ATTR               49 (NULL|self + remove_user)
            1680 LOAD_FAST                3 (USERNAME)
            1682 CALL                     1
            1690 POP_JUMP_IF_FALSE       22 (to 1736)

1211        1692 LOAD_GLOBAL             20 (log)
            1702 LOAD_ATTR               23 (NULL|self + info)
            1722 LOAD_CONST              35 ('User removed successfully based on the request')
            1724 CALL                     1
            1732 POP_TOP
            1734 RETURN_CONST            14 (None)

1213     >> 1736 LOAD_GLOBAL             20 (log)
            1746 LOAD_ATTR               31 (NULL|self + error)
            1766 LOAD_CONST              36 ('Failed to remove ')
            1768 LOAD_FAST                3 (USERNAME)
            1770 FORMAT_VALUE             0
            1772 LOAD_CONST              37 (' from database')
            1774 BUILD_STRING             3
            1776 CALL                     1
            1784 POP_TOP

1214        1786 LOAD_FAST                0 (self)
            1788 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1808 LOAD_CONST               8 ('UKF')
            1810 CALL                     1
            1818 POP_TOP
            1820 RETURN_CONST            14 (None)

1216     >> 1822 LOAD_FAST                0 (self)
            1824 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1844 LOAD_CONST               9 ('IC')
            1846 CALL                     1
            1854 POP_TOP

1217        1856 LOAD_GLOBAL             20 (log)
            1866 LOAD_ATTR               31 (NULL|self + error)
            1886 LOAD_CONST              10 ('Wrong password given')
            1888 CALL                     1
            1896 POP_TOP
            1898 RETURN_CONST            14 (None)

1220     >> 1900 LOAD_GLOBAL             20 (log)
            1910 LOAD_ATTR               31 (NULL|self + error)
            1930 LOAD_CONST              38 ('Invalid API inputted: ')
            1932 LOAD_FAST                2 (API)
            1934 FORMAT_VALUE             0
            1936 BUILD_STRING             2
            1938 CALL                     1
            1946 POP_TOP

1221        1948 LOAD_FAST                0 (self)
            1950 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            1970 LOAD_CONST              39 ('IAPI')
            1972 CALL                     1
            1980 POP_TOP
            1982 RETURN_CONST            14 (None)
         >> 1984 PUSH_EXC_INFO

1223        1986 LOAD_GLOBAL             50 (Exception)
            1996 CHECK_EXC_MATCH
            1998 POP_JUMP_IF_FALSE       51 (to 2102)
            2000 STORE_FAST               8 (e)

1225        2002 LOAD_GLOBAL             20 (log)
            2012 LOAD_ATTR               31 (NULL|self + error)
            2032 LOAD_CONST              40 ('Unexpected error occurred: ')
            2034 LOAD_FAST                8 (e)
            2036 FORMAT_VALUE             0
            2038 BUILD_STRING             2
            2040 CALL                     1
            2048 POP_TOP

1226        2050 LOAD_FAST                0 (self)
            2052 LOAD_ATTR                3 (NULL|self + _DATABASE__error)
            2072 LOAD_CONST               8 ('UKF')
            2074 CALL                     1
            2082 POP_TOP
            2084 POP_EXCEPT
            2086 LOAD_CONST              14 (None)
            2088 STORE_FAST               8 (e)
            2090 DELETE_FAST              8 (e)
            2092 RETURN_CONST            14 (None)
         >> 2094 LOAD_CONST              14 (None)
            2096 STORE_FAST               8 (e)
            2098 DELETE_FAST              8 (e)
            2100 RERAISE                  1

1223     >> 2102 RERAISE                  0
         >> 2104 COPY                     3
            2106 POP_EXCEPT
            2108 RERAISE                  1
ExceptionTable:
  4 to 304 -> 1984 [0]
  308 to 382 -> 1984 [0]
  386 to 460 -> 1984 [0]
  464 to 566 -> 1984 [0]
  570 to 872 -> 1984 [0]
  876 to 956 -> 1984 [0]
  960 to 1034 -> 1984 [0]
  1038 to 1112 -> 1984 [0]
  1116 to 1190 -> 1984 [0]
  1194 to 1386 -> 1984 [0]
  1390 to 1464 -> 1984 [0]
  1468 to 1542 -> 1984 [0]
  1546 to 1732 -> 1984 [0]
  1736 to 1818 -> 1984 [0]
  1822 to 1896 -> 1984 [0]
  1900 to 1980 -> 1984 [0]
  1984 to 2000 -> 2104 [1] lasti
  2002 to 2082 -> 2094 [1] lasti
  2094 to 2102 -> 2104 [1] lasti
  (The pandas lib needs translation)