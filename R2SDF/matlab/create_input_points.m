%������ɷ�����������
N=16384;
QUANTI_BIT = 16 ;%16bit�з�����

kn = 0:1:N-1;

input_real = ceil((2*rand(1,N)-1)*2^(QUANTI_BIT-2));%rand()�����ɣ�0��1��֮��������
input_img  = ceil((2*rand(1,N)-1)*2^(QUANTI_BIT-2));%��Ҫע����Ǹô����ݲ�����QUANTI_BIT-1,����Ӳ������Ľ������ȷ��Ӳ��û����16bit�з��Ż����Ͻ���λ����չ��
% input_real = unifrnd(-2,2,1,N)
x = linspace(0,0,N);
for n = 1:N
    x(n) = input_real(n)+(input_img(n))*j;
end
X = fft(x,N);
display(X/N);

file_input_real = fopen('input_real.txt','wt');
file_input_img = fopen('input_img.txt','wt');
    for k = 1:N
        s_real = input_real(k);
        if s_real>32670
            s_real=s_real-1;
        elseif s_real<0 %����ȡ����
            s_real = s_real + 2^QUANTI_BIT;
        end
        ss_real = dec2hex(s_real,log2(QUANTI_BIT));%����Ϊ����

        s_img = input_img(k);
        if s_img>0
            s_img=s_img-1;
        elseif s_img<0 %����ȡ����
            s_img = s_img + 2^QUANTI_BIT;
        end
        ss_img = dec2hex(s_img,log2(QUANTI_BIT));

        if k == N
            fprintf(file_input_real, '%s\n',ss_real);      %����д��
            fprintf(file_input_img, '%s\n',ss_img);      %����д��
        else
            fprintf(file_input_real, '%s\n',ss_real);      %����д��
            fprintf(file_input_img, '%s\n',ss_img);      %����д��
        end
    end
fclose(file_input_real);
fclose(file_input_img);