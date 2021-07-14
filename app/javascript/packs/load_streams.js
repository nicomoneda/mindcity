/* <script src="https://embed.twitch.tv/embed/v1.js"></script> */

const load_streams = () => {
  const twitch_ebds = document.querySelectorAll(`.twitch-embed`)
  console.log("coucou...")
  twitch_ebds.forEach((twitch_ebd) => {
    const stream_info = twitch_ebd.getAttribute('data-stream')
    console.log("Créations d'un lecteur...")
    new Twitch.Embed(`twitch-${stream_info}`, {
      width: 940,
      height: 480,
      channel: stream_info,
      theme: "dark",
      autoplay: false,
      layout: 'video',
    });
    console.log("Lecteur créé !")
  });
}

export default load_streams;