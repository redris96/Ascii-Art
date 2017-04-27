

im = imread('pick.png');
im = proc(im);
x = 58;
y = 88;
w = 5;
siz = size(im);
fileID = fopen('art.txt','w');
for x=1:floor(siz(1)/w -1)
    for y=1:floor(siz(2)/w -1)
        nose = ed(w*x:w*x+w-1,w*y:w*y+w-1);
        % v = proc(imresize(imread('vert.png'), [5,5]));
        % d = proc(imread('diag.png'));
        % h = proc(imread('minus.jpg'));
        v = zeros(5,5);
        h = v;
        h(3,:) = 1;
        v(:,3) = 1;
        d = diag(ones(1,5));
        nose = uint8(nose);
        v = uint8(v);
        h = uint8(h);
        d = uint8(d);
        z = uint8(zeros(5));
        a = ssim(nose, v);
        b = ssim(nose, d);
        c = ssim(nose, h);
        e = ssim(nose, z);
        if e == 1
            s=' ';
        elseif a > max(b,c)
            s = '|';
        elseif b > max(a,d)
            s = '_';
        else 
            s = '\';
        end
        fprintf(fileID, '%s', s);
    end
    fprintf(fileID, '\n');
end
% imshow(im);