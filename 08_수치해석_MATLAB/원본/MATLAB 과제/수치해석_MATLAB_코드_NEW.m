% y'' + 4y' + 8y = 2cos(3t) + sin(5t) + 10
% 1차 ODEs
% y1 = y, y2 = y'
% y1' = y2
% y2' = 2cos(3t) + sin(5t) + 10 - 4y2 - 8y1

%   0~4.5까지 계산결과를 Δt=0.001간격으로 계산
dt = 0.001;
t_end = 4.5;
t = 0:dt:t_end;

% 초기 조건
y1_0 = 1; % 퀴즈 내 그래프 상 1로 주어짐 
y2_0 = 0; % y'(0)
Y = [y1_0; y2_0];

% 수식 작성
dYdt = @(t, Y) [Y(2); 2*cos(3*t) + sin(5*t) + 10 - 4*Y(2) - 8*Y(1)];

% 결과물 위해 미리 할당하기 
y1 = zeros(size(t));
y2 = zeros(size(t));

% 4차 RK법을 이용하기
n = length(t);  % Assuming t is already defined as the time vector
ti = 0;  % Start time
t_end = t(end);  % End time

if n == 2
    h = t(2) - t(1);  % Assuming t is evenly spaced
    t = (ti:h:t_end)';
    n = length(t);
    if t(n) < t_end
        t(n+1) = t_end;
        n = n + 1;
    end
end


y = zeros(n, length(y1_0));
Y = y1_0;
np = 1;



% RK4 application
while true
    tend = t(np+1);
   
    
    for i = 1:length(t)
        if t(i) + dt > tend
            dt = tend - t(i);
        end
        
        k1 = dYdt(t(i), Y)';
        ymid =  Y + k1 .* dt ./ 2;
      
        k2 = dYdt(t(i) + hh/2, ymid)';
        ymid =  Y + k2 .* dt ./ 2;
        
        k3 = dYdt(t(i) + dt/2, ymid)';
        ymid =  Y + k3 .* dt;
        
        k4 = dYdt(t(i) + dt, ymid)';
        
        phi = (k1 + 2*(k2 + k3) + k4) / 6;
        
        Y = Y + phi' * dt;
        t(i) = t(i) + dt;
        
        
        if t(i) >= tend
            break;
        end
    end
    
    np = np + 1;
   
   
    
    if t(i) >= t_end
        break;
    end
end

Y = yp;  % Final solution stored in Y


% ①에서 구한 결과를 0.3 간격으로 데이터 추출
interval = 0.3;
indices = round(0:interval/dt:t_end/dt) + 1; 
t_extracted = t(indices);
y1_extracted = y1(indices);

% 결과를 명령창에 출력
disp('   ');
disp('0.3 간격으로 (x,y) 데이터를 추출하면 아래와 같다:');
disp('   ');
disp([t_extracted' y1_extracted']);

% ②에서 추출한 결과를 이용하여 Simpson 3/8공식을 적용하여 적분 계산
n = length(y1_extracted) - 1;
h = interval;
integral = y1_extracted(1) + y1_extracted(end);

for i = 2:n
    if mod(i, 3) == 0
        integral = integral + 2*y1_extracted(i);
    else
        integral = integral + 3*y1_extracted(i);
    end
end
integral = integral * (3*h / 8);

% 결과를 명령창에 출력
disp('②에서 추출한 결과를 이용하여 Simpson 3/8공식을 적용하여 적분 계산 후 결과를 명령창에 출력:');
disp('   ');
disp(integral);

%  ②에서 추출한 결과를 이용하여 8차 다항식 곡선접합
p = polyfit(t_extracted, y1_extracted, 8);% polyfit 내장함수 사용 완료
y1_fitted = polyval(p, t);

% 그래프 작성
figure;
plot(t, y1, 'r-', 'DisplayName', 'Runge-Kutta 4th Order'); % ①의 결과는 빨간색 실선
hold on;
plot(t_extracted, y1_extracted, 'ko', 'DisplayName', 'Extracted Data'); % ②의 결과는 검은색 o marker
plot(t, y1_fitted, 'b-', 'DisplayName', '8th Degree Polynomial Fit'); % ④의 결과는 파란색 실선

% legend 함수 이용하여 그래프 좌측 상단에 범례 추가 
legend('Location', 'northwest', 'Orientation', 'vertical');

title('Solution of ODE using 4th Order Runge-Kutta Method');
xlabel('t');
ylabel('y');
xlim([0, 4.5]); % X축 범위 지정
ylim([1, 1.5]); % Y축 범위 지정
hold off;