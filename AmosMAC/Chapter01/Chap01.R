# vers. 1.0
### ----- ��1�� ----- ###

# ���̋L�����V���[�v�L��(#)�Ƃ����܂���
# RStudio(R)�́A���̋L������E�ɏ����ꂽ���e�͖������܂�
# ����𗘗p����R�̃X�N���v�g�ł�#�L���E�ɃR�����g�i���Y�^�j���������Ƃ������ł�

# ���{��ݒ� R�����RStudio���C���X�g�[�����1�x��������1�s�����s���Ă�������
source ("http://rmecab.jp/R/Rprofile.R")

# ������R�ŃV�~�����[�V����
# �O���1����\������kuji���쐬
kuji <- c("�O��","1��")
# kuji�̒��g���m�F
kuji

# kuji�̗v�f��2��������R�Ŗ��߂�������
#�u�O��v�Ɓu1���v�� �X�X�F�P�̊����ŏo������悤��
# �����ł���
sample(kuji, 1, prob = c(99,1))
# sample�͖����(�����_��)�ɑI�яo���֐���
# ��ł�1�������o���Ă���

# 100���o���ꍇ��replace = TRUE��ǉ��Ŏw�肷��
# ���̎w��ɂ�艽������Ă��X�X�F�P�̊������ς��Ȃ�
sample(kuji, 100, prob = c(99,1), replace = TRUE)


#�@�����𖈓�100��A1�T�Ԉ����ĂP�����o���{�����V�~�����[�V��������
replicate (7, sample (kuji, 100, prob = c(99,1), replace = TRUE) ) # �P�O�O�s�V��̌��ʂ��\�������
# replicate �Ƃ����֐��͖��߂��w�肳�ꂽ�񐔎��s���Ă����
### �����@replicate (�񐔁C����)

# �P�����o���{���𐔂���
sum ( replicate (7, sample (kuji, 100, prob = c(99,1), replace = TRUE) ) == "1��")
### ������sum (A == "1��")�ŁAA�̒��Ɋ܂܂��P���𐔂��閽��


# ����100�񂭂����������Ƃ�7���ԌJ��Ԃ���1���̖{�������v���邱�Ƃ��A�����1000�T�J��Ԃ����߂��쐬���Ă݂�
# ���ʂ�res�Ƃ��ĕۑ�����
res <- replicate(1000, sum(replicate (7, sample (kuji, 100, prob = c(99,1), replace = TRUE) ) == "1��"))
### �����@replicate (1000 , ���v�ireplicate (7, 100�񂭂����������ꍇ��1���̖{���j)

# �V���v���ȃq�X�g�O����
hist(res)

#  ���������Â����O���t�𐶐�
# ggplot2���܂��C���X�g�[�����Ă��Ȃ��ꍇ��
# �����́w�ԊO�ҁx���Q�Ƃ̂���
# ���邢�͉��̖��߂��i����#���폜���Ă���j���s���Ă��悢
# install.packages("ggplot2")
# �Ȃ��p�b�P�[�W�̃C���X�g�[����1�񂾂����s����΂悢�i�ʂ̓���RStudio�𗘗p����ꍇ�A���ł�ggplot2���C���X�g�[�����Ă���̂Ȃ�΁A�ēx�C���X�g�[����������s����K�v�͂Ȃ��j

# ggplt2�𗘗p���邽�߂ɓǂݍ���
library(ggplot2)

### �`��̂��߂Ƀf�[�^�𐮌`
resD <- as.data.frame(table(res))
# �`����10�s������\��
head (resD, n = 10)# 

### �Ȃ����l�̓����_���ɐ������Ă���̂ŁA���s���ʂ͖���A�����ɈقȂ�܂�
ggplot(resD, aes(y = Freq, x = res)) +  geom_histogram(binwidth = 1, stat="identity", fill = "steelblue") + xlab("�T�̓������") + ylab ("�T�̐�") + ggtitle("�q�X�g�O����") 



# RStudio��������ƐG���Ă݂�

# �����Z
1 + 2 + 3 + 4 + 5

sum (1:1000)

1:6

sample (1:6, 1)
sample (1:6, 1)

sample (1:6, 100, replace = TRUE)

# �Čf
kuji <- c("�O��","1��")
kuji # �m�F
# kuji����1�����o���B�������u�O��v�Ɓu1���v��99:1�̊����ŏo������悤�ݒ�
sample(kuji, 1, prob = c(99,1))

sample(kuji, 100, prob = c(99,1), replace = TRUE)


# �T�C�R����100��i100�j�U��
table (sample (1:6, 100, replace = TRUE))

# �q�X�g�O����
hist (sample (1:6, 100, replace = TRUE), breaks = 0:6)


# �T�C�R���̕��ϒl�i�����_���ɐU�������ʂȂ̂Ŗ��񐔒l�͈قȂ�j
mean(sample (1:6, 100, replace = TRUE))

# �T�C�R����1����U��V�~�����[�V�����̃q�X�g�O����
res <- sample(1:6, 10000, replace = TRUE)

# �V���v���ȃq�X�g�O����
hist(res, breaks = 0:6)

# �����Â����O���t���쐬���邽�߃f�[�^�𐮌`
saikoro <- data.frame(�T�C�R�� = res)
# �`���������m�F
head (saikoro)

# ���ۂɕ`�悷��
ggplot(saikoro, aes (x = �T�C�R��)) + xlim(1,6) + geom_histogram(binwidth = 1 , fill = "steelblue", colour="black",  alpha = 0.5) + xlab("�o����") + ylab ("��") + ggtitle("�T�C�R����1����U��������") 


# �T�C�R���̕��ςƊ��Ғl
# �����ł����߂��J��Ԃ����s���Ă����replicate�֐��𗘗p
res <- replicate(100000,  mean (sample(1:6, 100,replace = TRUE)))
# �V���v���ȃq�X�g�O����
hist(res)

# ���������Â����O���t�𐶐����邽�߃T�C�R�������̌��ʃf�[�^�𐮌`
saikoro <- data.frame(�T�C�R�� = res)
# ���ۂɕ`���Ă݂�
ggplot(saikoro, aes (x = �T�C�R��)) + geom_histogram(binwidth = .1, fill = "steelblue", colour="black",  alpha = 0.5) + xlab("���Ғl") + ylab ("��") + ggtitle("�T�C�R����100��U�������Ғl") 
