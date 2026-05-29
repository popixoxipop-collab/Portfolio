% 초기값 및 구간 설정
tspan = 0:0.5:1; % t는 0부터 1까지 0.5 간격으로
y0 = 2; % 초기 조건 y(t=0) = 0
h = 0.5; % RK4의 고정된 스텝 사이즈

% 미분 방정식 정의
dydt = @(t, y) 4 * exp(0.8 * t) - 0.5 * y;

% 초기화
n = length(tspan);
ti = tspan(1); 
tf = tspan(n);

if n == 2
    t = (ti:h:tf)';
    n = length(t);
    if t(n) < tf
        t(n+1) = tf;
        n = n + 1;
    end
else 
    t = tspan;
end

tt = ti;
y = zeros(n, length(y0));
y(1,:) = y0;
np = 1;
tp(np) = tt;
yp(np,:) = y(1,:);
i = 1;

% RK4 적용
while true
    tend = t(np+1);
    hh = t(np+1) - t(np);
    if hh > h
        hh = h;
    end
    
    while true
        if tt + hh > tend
            hh = tend - tt;
        end
        
        k1 = dydt(tt, y(i,:))';
        ymid = y(i,:) + k1 .* hh ./ 2;
      
        k2 = dydt(tt + hh/2, ymid)';
        ymid = y(i,:) + k2 .* hh ./ 2;
        
        k3 = dydt(tt + hh/2, ymid)';
        ymid = y(i,:) + k3 .* hh;
        
        k4 = dydt(tt + hh, ymid)';
        
        phi = (k1 + 2*(k2 + k3) + k4) / 6;
        
        y(i+1,:) = y(i,:) + phi' * hh;
        tt = tt + hh;
        i = i + 1;
        
        if tt >= tend
            break;
        end
    end
    
    np = np + 1;
    tp(np) = tt;
    yp(np,:) = y(i,:);
    
    if tt >= tf
        break;
    end
end

% 결과 출력
disp('t          y');
disp([tp' yp]);