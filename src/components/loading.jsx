import React, { useEffect } from 'react';
import '../index.css'
import anime from 'animejs/lib/anime.es.js';


const Loading = () => {
    useEffect(() => {
        anime({
            targets: '#achmal path',
            strokeDashoffset: [anime.setDashoffset, 0],
            easing: 'easeInOutSine',
            duration: 1500,
            delay: function (el, i) { return i * 250 },
            direction: 'alternate',
            loop: true
        });
    }, []);
    return (
        <div className='flex justify-center items-center w-screen h-screen lg:px-0 px-10 bg-slate-950'>
            <svg id='achmal' width="484" height="116" viewBox="0 0 484 116" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M481.781 3V1.5H480.281H467.203H465.703V3V111V112.5H467.203H480.281H481.781V111V3Z" stroke="#86A7FC" strokeWidth="3" />
                <path d="M429.521 51.7163L429.53 51.733L429.539 51.7495C430.613 53.6914 431.18 56.0335 431.18 58.8281V63.375H419.812C414.508 63.375 409.669 63.9244 405.308 65.0389C400.949 66.153 397.168 67.8126 393.995 70.0419C390.8 72.2399 388.335 75.0275 386.625 78.3952C384.906 81.7342 384.07 85.5616 384.07 89.8359C384.07 94.3183 385.195 98.4135 387.457 102.084L387.464 102.094L387.47 102.104C389.779 105.718 392.983 108.585 397.038 110.711L397.044 110.715C401.183 112.859 405.951 113.906 411.305 113.906C415.602 113.906 419.51 113.173 423.005 111.676L423.014 111.672C426.425 110.182 429.391 108.325 431.894 106.089C432.268 108.272 432.767 110.121 433.415 111.601L433.808 112.5H434.789H448.359H449.859V111V109.875V109.565L449.736 109.28C448.907 107.36 448.257 105.027 447.803 102.261C447.391 99.4691 447.188 96.8514 447.188 94.4062V58.9688C447.188 53.0885 445.924 48.077 443.295 44.0276C440.739 39.9724 437.177 36.9453 432.653 34.9561C428.209 32.9816 423.121 32.0156 417.422 32.0156C412.687 32.0156 408.347 32.6918 404.416 34.0668C400.567 35.383 397.217 37.1988 394.391 39.5293C391.631 41.7964 389.48 44.3618 387.969 47.2311C386.463 50.0941 385.688 53.0275 385.688 56.0156V57.5156H387.188H400.195H401.695V56.0156C401.695 54.2586 402.252 52.6026 403.431 51.0143C404.665 49.4131 406.377 48.0815 408.624 47.0439C410.877 46.0244 413.54 45.4922 416.648 45.4922C419.998 45.4922 422.702 46.0736 424.827 47.1567C426.956 48.2424 428.502 49.7596 429.521 51.7163ZM431.18 75.5156V89.2444C430.805 89.9429 430.345 90.6602 429.792 91.3969L429.787 91.4043L429.781 91.4118C428.147 93.6484 425.909 95.5741 423.023 97.1722C420.229 98.7197 416.97 99.5156 413.203 99.5156C410.195 99.5156 407.754 98.9859 405.817 98.001C403.897 96.9544 402.506 95.5845 401.581 93.8967C400.632 92.1632 400.148 90.2338 400.148 88.0781C400.148 85.96 400.612 84.1947 401.485 82.7276L401.489 82.72L401.493 82.7125C402.382 81.177 403.688 79.8763 405.463 78.8202C407.246 77.7586 409.51 76.9411 412.293 76.4024L412.304 76.4002L412.316 76.3978C415.099 75.8141 418.298 75.5156 421.922 75.5156H431.18Z" stroke="#86A7FC" strokeWidth="3" />
                <path d="M275.977 111V55.5872C276.406 54.664 276.889 53.7897 277.423 52.9633C278.827 50.7937 280.695 49.0927 283.051 47.8503C285.356 46.6351 288.31 45.9844 291.984 45.9844C295.096 45.9844 297.732 46.5177 299.934 47.5338L299.945 47.5388L299.956 47.5437C302.085 48.4854 303.715 49.9875 304.873 52.0969L304.878 52.1067L304.884 52.1165C306.069 54.202 306.727 57.1038 306.727 60.9375V111V112.5H308.227H321.234H322.734V111V60.4085C322.896 59.0045 323.197 57.6598 323.634 56.3718C324.369 54.3464 325.419 52.5721 326.785 51.0356L326.792 51.028L326.799 51.0203C328.147 49.4607 329.817 48.23 331.831 47.3305C333.809 46.4465 336.126 45.9844 338.812 45.9844C341.999 45.9844 344.654 46.4563 346.82 47.348L346.836 47.3546L346.852 47.361C348.943 48.1652 350.551 49.5801 351.701 51.675L351.709 51.6905L351.718 51.7057C352.89 53.7254 353.555 56.728 353.555 60.8672V111V112.5H355.055H368.133H369.633V111V61.0078C369.633 56.1154 369.058 51.8265 367.872 48.1701C366.688 44.52 364.916 41.471 362.525 39.0757C360.191 36.6443 357.312 34.8604 353.921 33.713C350.594 32.5711 346.816 32.0156 342.609 32.0156C337.598 32.0156 333.085 32.9403 329.106 34.8292C325.173 36.6493 321.835 39.1432 319.112 42.3114L319.112 42.3114L319.104 42.3218C318.941 42.5141 318.781 42.708 318.624 42.9036C317.677 41.3332 316.578 39.9302 315.323 38.7014C312.954 36.3829 310.155 34.695 306.946 33.6406C303.774 32.5515 300.329 32.0156 296.625 32.0156C291.384 32.0156 286.706 32.9619 282.628 34.9C279.966 36.1344 277.586 37.7136 275.494 39.6352L275.272 34.8522L275.205 33.4219H273.773H261.398H259.898V34.9219V111V112.5H261.398H274.477H275.977V111Z" stroke="#86A7FC" strokeWidth="3" />
                <path d="M196.734 3V1.5H195.234H182.227H180.727V3V111V112.5H182.227H195.234H196.734V111V57.0683C197.478 55.6361 198.331 54.3078 199.292 53.0812C201.086 50.8518 203.194 49.1161 205.623 47.8579C208.066 46.6157 210.782 45.9844 213.797 45.9844C216.914 45.9844 219.435 46.5194 221.423 47.5135L221.434 47.5192L221.446 47.5246C223.361 48.4426 224.837 49.9376 225.875 52.0953L225.875 52.0953L225.88 52.1055C226.913 54.2142 227.484 57.1483 227.484 61.0078V111V112.5H228.984H242.062H243.562V111V61.1484C243.562 56.0314 242.99 51.6237 241.803 47.9617C240.621 44.2715 238.876 41.1988 236.531 38.8005C234.249 36.4187 231.485 34.6983 228.267 33.6406C225.087 32.5489 221.547 32.0156 217.664 32.0156C212.867 32.0156 208.448 32.9713 204.431 34.9047C201.581 36.2589 199.014 38.0247 196.734 40.1961V3Z" stroke="#86A7FC" strokeWidth="3" />
                <path d="M155.227 85.4531H153.844L153.732 86.8306C153.52 89.4116 152.66 91.6935 151.148 93.7111C149.612 95.7154 147.645 97.3015 145.224 98.4692C142.814 99.6308 140.179 100.219 137.297 100.219C133.459 100.219 130.361 99.4836 127.927 98.1022C125.472 96.6348 123.522 94.7048 122.061 92.3002C120.608 89.8323 119.564 87.0641 118.939 83.983C118.303 80.8476 117.984 77.6663 117.984 74.4375V71.4844C117.984 68.2584 118.302 65.1047 118.936 62.0215C119.608 58.9344 120.677 56.1601 122.134 53.687C123.598 51.2343 125.546 49.3091 127.994 47.8919L127.994 47.8919L128.001 47.8878C130.436 46.4602 133.51 45.7031 137.297 45.7031C140.536 45.7031 143.284 46.423 145.595 47.8097L145.609 47.8179L145.623 47.8258C148.029 49.2006 149.9 51.0336 151.264 53.335L151.269 53.3438L151.275 53.3525C152.69 55.668 153.513 58.2716 153.731 61.1898L153.834 62.5781H155.227H167.602H169.17L169.1 61.0112C168.855 55.5279 167.383 50.5885 164.66 46.229C161.986 41.8253 158.296 38.3639 153.621 35.8531C148.913 33.2774 143.456 32.0156 137.297 32.0156C131.403 32.0156 126.183 33.0546 121.679 35.1828L121.674 35.1856C117.259 37.2949 113.561 40.1998 110.602 43.8989L110.602 43.8989L110.595 43.9085C107.706 47.5802 105.538 51.8032 104.081 56.5609L104.081 56.5609L104.078 56.5703C102.674 61.2669 101.977 66.2406 101.977 71.4844V74.4375C101.977 79.6814 102.674 84.677 104.077 89.4178L104.08 89.4266L104.083 89.4354C105.54 94.1465 107.708 98.3442 110.594 102.013L110.602 102.023C113.561 105.722 117.259 108.627 121.674 110.736L121.679 110.739C126.183 112.867 131.403 113.906 137.297 113.906C142.913 113.906 148.098 112.683 152.826 110.221L152.837 110.215C157.524 107.725 161.338 104.46 164.248 100.416C167.218 96.3078 168.849 91.8381 169.1 87.0311L169.182 85.4531H167.602H155.227Z" stroke="#86A7FC" strokeWidth="3" />
                <path d="M45.4803 7.125H44.0625H43.029L42.6609 8.09073L3.63744 110.466L2.86201 112.5H5.03906H18.8906H19.9417L20.3005 111.512L29.6721 85.7109H70.3865L79.778 111.513L80.1372 112.5H81.1875H95.1094H97.2892L96.5104 110.464L57.3463 8.08905L56.9775 7.125H55.9453H54.5275H52.9922H47.0156H45.4803ZM50.0082 29.7234L65.251 71.6016H34.797L50.0082 29.7234Z" stroke="#86A7FC" strokeWidth="3" />
            </svg>
        </div>
    )
}

export default Loading
