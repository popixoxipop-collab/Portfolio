% 주어진 함수
f = @(x) 1 ./ (1 + 25 * x.^2);

% 등간격으로 5개의 점 생성
x_points_5 = linspace(0, 1, 5);
y_points_5 = f(x_points_5);

% Cubic 스플라인 보간 (5개의 점)
pp_5 = spline(x_points_5, [0, y_points_5, 0]);

% 각 스플라인 구간의 수식 표시 (5개의 점)
fprintf('5개의 점으로 등간격일 때의 4개 구간:\n');
for i = 1:length(pp_5.pieces)
    piece = pp_5.pieces(i);
    coefs = pp_5.coefs(piece,:);
    x_knot = pp_5.breaks(piece);
    a = coefs(1);
    b = coefs(2);
    c = coefs(3);
    d = coefs(4);
    fprintf('구간 %.2f ~ %.2f: %.4f * (x - %.2f)^3 + %.4f * (x - %.2f)^2 + %.4f * (x - %.2f) + %.4f\n', x_knot, x_knot+0.25, a, x_knot, b, x_knot, c, x_knot, d);
end

% 등간격으로 3개의 점 생성
x_points_3 = linspace(0, 1, 3);
y_points_3 = ppval(pp_5, x_points_3);

% Cubic 스플라인 보간 (3개의 점)
pp_3 = spline(x_points_3, [0, y_points_3, 0]);

% 각 스플라인 구간의 수식 표시 (3개의 점)
fprintf('\n3개의 점으로 등간격일 때의 2개 구간:\n');
for i = 1:length(pp_3.pieces)
    piece = pp_3.pieces(i);
    coefs = pp_3.coefs(piece,:);
    x_knot = pp_3.breaks(piece);
    a = coefs(1);
    b = coefs(2);
    c = coefs(3);
    d = coefs(4);
    fprintf('구간 %.2f ~ %.2f: %.4f * (x - %.2f)^3 + %.4f * (x - %.2f)^2 + %.4f * (x - %.2f) + %.4f\n', x_knot, x_knot+0.25, a, x_knot, b, x_knot, c, x_knot, d);
end