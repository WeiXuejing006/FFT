% FFT��ת���ӵ�����
N=16384;
QUANTI_BIT = 16 ;%16bit�з�������������

kn = 0:1:N-1;

w_real = cos(-2*pi*kn/N);
w_img  = sin(-2*pi*kn/N);

%����������ȡ����
w_real_d = ceil(w_real*2^(QUANTI_BIT-1));
w_img_d  = ceil(w_img*2^(QUANTI_BIT-1));

file_tw_real = fopen('tw_real.txt','wt');
file_tw_img = fopen('tw_img.txt','wt');
    for i = 1:N
        s_real = w_real_d(i);
        if s_real>0
            s_real=s_real-1;
        end
        if s_real<0 %����ȡ����
            s_real = s_real + 2^QUANTI_BIT;
        end
        ss_real = dec2hex(s_real,log2(QUANTI_BIT));

        s_img = w_img_d(i);
        if s_img>0
            s_img=s_img-1;
        end
        if s_img<0 %����ȡ����
            s_img = s_img + 2^QUANTI_BIT;
        end
        ss_img = dec2hex(s_img,log2(QUANTI_BIT));

        if i == N
            fprintf(file_tw_real, '%s\n',ss_real);      %����д��
            fprintf(file_tw_img, '%s\n',ss_img);      %����д��
        else
            fprintf(file_tw_real, '%s\n',ss_real);      %����д��
            fprintf(file_tw_img, '%s\n',ss_img);      %����д��
        end
    end
fclose(file_tw_real);
fclose(file_tw_img);
