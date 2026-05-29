% 2차 스플라인
coefs_2 = pp_5.coefs; % 2차 스플라인의 계수
x_knots_2 = pp_5.breaks; % 스플라인의 노트 (절점)
piece_2 = 1; % 2차 스플라인은 첫 번째 스플라인 세그먼트

% 2차 스플라인 수식 계수 추출
a_2 = coefs_2(piece_2, 1);
b_2 = coefs_2(piece_2, 2);
c_2 = coefs_2(piece_2, 3);
d_2 = coefs_2(piece_2, 4);

% 2차 스플라인 수식 출력
fprintf('2차 스플라인 수식: \n');
fprintf('%.4f * (x - %.4f)^2 + %.4f * (x - %.4f) + %.4f\n\n', a_2, x_knots_2(piece_2), b_2, x_knots_2(piece_2), c_2);

% 3차 스플라인
coefs_3 = pp_3.coefs; % 3차 스플라인의 계수
x_knots_3 = pp_3.breaks; % 스플라인의 노트 (절점)
piece_3 = 1; % 3차 스플라인은 첫 번째 스플라인 세그먼트

% 3차 스플라인 수식 계수 추출
a_3 = coefs_3(piece_3, 1);
b_3 = coefs_3(piece_3, 2);
c_3 = coefs_3(piece_3, 3);
d_3 = coefs_3(piece_3, 4);

% 3차 스플라인 수식 출력
fprintf('3차 스플라인 수식: \n');
fprintf('%.4f * (x - %.4f)^3 + %.4f * (x - %.4f)^2 + %.4f * (x - %.4f) + %.4f\n\n', a_3, x_knots_3(piece_3), b_3, x_knots_3(piece_3), c_3, x_knots_3(piece_3), d_3);