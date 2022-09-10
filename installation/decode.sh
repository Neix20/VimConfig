# Read From File
pswd=""
salt=""

# Decode Password
echo $pswd | openssl enc -d -des3 -base64 -k "${salt}" -pass pass:mypasswd -pbkdf2
