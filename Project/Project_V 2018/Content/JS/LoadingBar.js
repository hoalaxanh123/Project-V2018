function ShowLoadingBar(cauLenhThongBao) {
    $('body').loadingModal({
        position: 'auto',
        text: cauLenhThongBao,
        color: '#fff',
        opacity: '0.7',
        backgroundColor: 'rgb(0,0,0)',
        animation: 'wave'
    });
}
function DisplayLoadingBar() {
    $('body').loadingModal('destroy');
}