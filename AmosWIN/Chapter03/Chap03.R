# vers. 1.0
### ----- ��3�� ----- ###

# �f�[�^�𕪊��\�ɂ��Ă݂�
dat <- read.csv (file.choose())# Chapter03_proj/sample.csv��I�����邱��
dat

table (dat)

# �p�C�v�������s�Ȃ��p�b�P�[�W���C���X�g�[���i�p�b�P�[�W�̃C���X�g�[�����@�ɂ��Ă͖{���w�ԊO�ҁx���Q�Ƃ��ꂽ��
# install.packages("dplyr") 

# �p�b�P�[�W�̗��p��錾
library (dplyr) 

# �p�C�v���Z�q���g���Ă݂�i���̃f�[�^�ɉE�̏�����K�p����j
dat %>% table

# �����\��ۑ�
dat2 <-  dat %>% table
dat2

# �J�C��挟������s����
dat2 %>% chisq.test 
# chisq.test (dat2)# �������Ă��������ʂ�������

# �Ɨ����̌���̈Ӗ�
survey <- read.csv(file.choose())# "Chapter03_proj/survey.csv"
survey %>% head # head (survey) �ɓ���


# ���I��ŕ����\���쐬
survey  %>% select (����, ��6) %>% table

# �O���t�i�ςݏグ�o�[�v���b�g�j��`��
library(ggplot2)
survey %>% ggplot(aes (x = ����, y = ��6, fill = ��6 )) + geom_bar(stat="identity")
# �p�C�v���Z�q%>%���g��Ȃ��œ����v���b�g���쐬
# ggplot(survey, aes (x = ����, y = ��6, fill = ��6 )) + geom_bar(stat="identity")

# �⑫�F�ʖ��ŕۑ����ăO���t��`�����@ 
table1 <- survey  %>% select (����, ��6) %>% table
   #### �V���v���Ȗ_�O���t
table1 %>% plot #   plot (table1)�ł�����

# �J�C��挟��
# �A�������u�X��Ƃ��q�̉񓚂͓Ɨ��ł���v�̌���
survey  %>% select (����, ��6) %>% table %>% chisq.test


# �Ȃ񂾁A�����
# ��7�ɂ��ĕ����\���쐬
survey  %>% select (����, ��7) %>% table
