document.addEventListener("DOMContentLoaded", function (event) {

  // サウンド
  const sound = document.querySelector(".sound");

  // 再生画面のサウンドイメージ
  const bgImage = document.querySelector(".back-ground");

  // サウンドの再生ボタン
  const playBtn = document.getElementById("play");

  // サウンド再生ボタンのアイコン
  const playIcon = document.querySelector("#play i");

  // サウンド選択ボタン
  const soundBtn = document.querySelectorAll(".sound-select button");

  // 時間表示
  const timeDisplay = document.getElementById("time-display");

  // 時間選択ボタン
  const timeBtn = document.querySelectorAll(".time-select button");

  // 時間開始・終了ボタン
  const startBtn = document.getElementById("start-button");
  const stopBtn = document.getElementById("stop-button");

  // 時間表示の最初の設定タイム
  let fakeDuration = 3600;

  // 最初の時間表示
  timeDisplay.textContent = `${Math.floor(fakeDuration / 60)}:${Math.floor(
    fakeDuration % 60
  )+"0"}`;

  // サウンド選択ボタンから選んだサウンドとイメージを再生させる
  soundBtn.forEach(option =>{
    option.addEventListener("click", function() {
      sound.src = this.getAttribute("data-sound");
      bgImage.src = this.getAttribute("data-image");
      checkPlaying(sound);
    });
  });


  // サウンド再生
  playBtn.addEventListener("click", function() {
    checkPlaying(sound);
  });

  // 時間の選択ボタン
  timeBtn.forEach(option => {
    option.addEventListener("click", function() {
      fakeDuration = this.getAttribute("data-time");
      timeDisplay.textContent = `${Math.floor(fakeDuration / 60)}:${Math.floor(
        fakeDuration % 60
      )+ "0"}`;
    });
  });

  // サウンドの再生と停止
  const checkPlaying = sound =>{
    if(sound.paused){
      sound.play();
      playIcon.innerHTML = `<i class="bi bi-pause-fill"></i>`;
    } else{
      sound.pause();
      playIcon.innerHTML = `<i class="bi bi-caret-right-fill">`;
    }
  };

  let countId;

  // タイマー開始
  startBtn.addEventListener("click", function() {
    countId = setInterval(counter, 1000);
    startBtn.disabled = true;
    stopBtn.disabled = "";
  });

  // タイマーストップ
  stopBtn.addEventListener("click", function() {
    clearInterval(countId);
    startBtn.disabled = "";
    stopBtn.disabled = true;
  });



  function counter() {
    if (fakeDuration === 1){
      timeDisplay.textContent = "00:00";
      clearInterval(countId);
      sound.pause();
      startBtn.disabled = "";
    } else {
      let elapsed = fakeDuration-=1;
      let seconds = Math.floor(elapsed % 60);
      let minutes = Math.floor(elapsed / 60);
      timeDisplay.textContent = `${minutes}:${seconds}`;
    }
  };



});