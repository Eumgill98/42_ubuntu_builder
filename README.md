# 42_ubuntu_builder
: Ubuntu Docker Builder for the Ecole 42 Dev Environment

## TODO_LIST
- [✔️] `Ubuntu` Dockerfile
- [✔️] `Vim` install
- [✔️] `docker volume mount`
- [✔️] `42 header`
- [✔️] `42 norminette` 

### 42 header e-mail & name change
`in dockerfile`

```dockerfile
# setting 42 header plugin 
RUN mkdir -p ~/.vim/plugin && \
    echo 'let g:user42 = "your_login"' >> ~/.vimrc && \
    echo 'let g:mail42 = "your_email@student.42.fr"' >> ~/.vimrc

```
- change your email & your name

## HOW TO USE
```bash
docker build -t ${build image name} .
```
- `dockerfile` build -> `.` : Can replace the directory where the docker file exists

```bash
docker run -it -v ${PWD}:/workspace ${build image name}
```
- `PWD` : Can replace local directory that mount docker directory
- if use `PWD` now directory mount

