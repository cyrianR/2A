function Y = TFCT(y, N, D, fenetre)

    Y =  buffer(y,N,N-D, 'nodelay');
    if fenetre == 'hann'
        window = hann(N);
        Y = Y.*window;
    elseif fenetre == 'rect'

    else 
        Y = 0;
    end
    Y = fft(Y);
    Y = Y(1:N/2+1,:);

end

