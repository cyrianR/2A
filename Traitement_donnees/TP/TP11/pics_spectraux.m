function [pics_t, pics_f] = pics_spectraux(S, eta_t, eta_f, epsilon)

    se = strel("rectangle",[eta_f eta_t]);
    S_dilated = imdilate(S, se);

    [pics_f, pics_t] = find((S_dilated == S) .* (S_dilated > epsilon));


end

