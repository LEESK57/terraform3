resource "aws_key_pair" "sdkim_key" {
    key_name = "sdkim1-key"
    public_key = file("../../.ssh/sdkim-key.pub")
    #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDa6VMHio/2T5SB8M/fUGTeqlwckgSvQqvlH1SRYTn76zwuIgLpG3mxAJ+IuGosgz7+wZIScJAmFsKqdc0dCp1SNZdKpPXBsvX0Xeoynhs4paRoQtJvtPc9EiYnkapgM5fLHnpLKBjevpyvGJFjQJxmM0uOgjjYRmvz02xP30sU+e9hx42AZGWcU8/Cd1frzJNt9+mUrg+7E7vYtV0talblngfusm0tLAaQ0AMr3YaK6ePfvFvJi5PucWpalMmq2+drhL4cOGtM7Oi16Qejb3KcSt37WkXdolK16D+x3TE/Hma/bZz0U56/YPW5onBSL9Tbrq+aGOVJJd97AkLcNyhwDQtBTVUQ3tcUmP561cRDzxOLnJwzQEl1dlc2SE+rta2fwGbe/6Kt4hgtl/0vIB2+c7q+ebdbV6LamNEEuPI6kL57GapCw5d9pYTCG21u8yia2Fl1GdOXbwRQGb+3ObxJ+dGJX6j5g/dSFG0OLKX5//UF28flbErIPgHflB2ZHFE="
}