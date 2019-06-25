#Initialize database
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" "--defaults-file=C:\ProgramData\MySQL\MySQL Server 8.0\my.ini" "-uroot" "-ppassword" "--default-character-set=utf8mb4" "-e" ^
"DROP DATABASE db;"
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" "--defaults-file=C:\ProgramData\MySQL\MySQL Server 8.0\my.ini" "-uroot" "-ppassword" "--default-character-set=utf8mb4" "-e" ^
"CREATE DATABASE db;"

# Create table
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" "--defaults-file=C:\ProgramData\MySQL\MySQL Server 8.0\my.ini" "-uroot" "-ppassword" "--default-character-set=utf8mb4" "-e" ^
"CREATE TABLE user ( ^
    _id INT PRIMARY KEY AUTO_INCREMENT, ^
    id VARCHAR(16) NOT NULL, ^
    pw VARCHAR(16) NOT NULL ^
); ^
CREATE TABLE post ( ^
    id INT PRIMARY KEY AUTO_INCREMENT, ^
    title TEXT NOT NULL, ^
    content TEXT NOT NULL, ^
    FULLTEXT KEY title (title), ^
    FULLTEXT KEY content (content) ^
);" db