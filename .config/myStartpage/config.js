// ╔╗ ╔═╗╔╗╔╔╦╗╔═╗
// ╠╩╗║╣ ║║║ ║ ║ ║
// ╚═╝╚═╝╝╚╝ ╩ ╚═╝
// ┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
// │  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││
// └─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘


const CONFIG = {
  // ┌┐ ┌─┐┌─┐┬┌─┐┌─┐
  // ├┴┐├─┤└─┐││  └─┐
  // └─┘┴ ┴└─┘┴└─┘└─┘

  // General
  name: 'Kavi',
  imageBackground: false,
  openInNewTab: false,
  twelveHourFormat: true,

  // Greetings
  greetingMorning: 'Good morning!',
  greetingAfternoon: 'Good afternoon,',
  greetingEvening: 'Good evening,',
  greetingNight: 'Go to Sleep!',

  // Layout
  bentoLayout: 'bento', // 'bento', 'lists', 'buttons'

  // Weather
  weatherKey: '51437201bc53b90b32fce0ee767fddd0', // Write here your API Key
  weatherIcons: 'Nord', // 'Onedark', 'Nord', 'Dark', 'White'
  weatherUnit: 'C', // 'F', 'C'
  language: 'en', // More languages in https://openweathermap.org/current#multi

  trackLocation: false, // If false or an error occurs, the app will use the lat/lon below
  defaultLatitude: '28.5876',
  defaultLongitude: '77.1690',

  // Autochange
  autoChangeTheme: false,

  // Autochabge by OS
  changeThemeByOS: true,

  // Autochange by hour options (24hrs format, string must be in: hh:mm)
  changeThemeByHour: false,
  hourDarkThemeActive: '05:30',
  hourDarkThemeInactive: '07:00',

  // ┌┐ ┬ ┬┌┬┐┌┬┐┌─┐┌┐┌┌─┐
  // ├┴┐│ │ │  │ │ ││││└─┐
  // └─┘└─┘ ┴  ┴ └─┘┘└┘└─┘

  firstButtonsContainer: [
    {
      id: '1',
      name: 'Github',
      icon: 'github',
      link: 'https://github.com/',
    },
    {
      id: '2',
      name: 'Mail',
      icon: 'mail',
      link: 'https://mail.tutanota.com/mail/Ms9OmzY-1V-2/',
    },
    {
      id: '3',
      name: 'Whatsapp',
      icon: 'message-circle-code',
      link: 'https://web.whatsapp.com',
    },
    {
      id: '4',
      name: 'Google',
      icon: 'search',
      link: 'https://google.com/',
    },
    {
      id: '5',
      name: 'Reddit',
      icon: 'glasses',
      link: 'https://www.reddit.com/',
    },
    {
      id: '6',
      name: 'Youtube',
      icon: 'youtube',
      link: 'https://youtube.com/',
    },
  ],

  secondButtonsContainer: [
    {
      id: '1',
      name: 'Music',
      icon: 'headphones',
      link: 'https://open.spotify.com',
    },
    {
      id: '2',
      name: 'twitter',
      icon: 'twitter',
      link: 'https://twitter.com/',
    },
    {
      id: '3',
      name: 'bot',
      icon: 'bot',
      link: 'https://discord.com/app',
    },
    {
      id: '4',
      name: 'Amazon',
      icon: 'shopping-bag',
      link: 'https://amazon.com/',
    },
    {
      id: '5',
      name: 'Hashnode',
      icon: 'pen-tool',
      link: 'https://hashnode.com/',
    },
    {
      id: '6',
      name: 'Figma',
      icon: 'figma',
      link: 'https://figma.com/',
    },
  ],

  // ┬  ┬┌─┐┌┬┐┌─┐
  // │  │└─┐ │ └─┐
  // ┴─┘┴└─┘ ┴ └─┘

  // First Links Container
  firstlistsContainer: [
    {
      icon: 'coffee',
      id: '1',
      links: [
        {
          name: 'Bard',
          link: 'https://bard.google.com/',
        },
        {
          name: 'College',
          link: 'https://aryabhattacollege.ac.in/',
        },
        {
          name: 'Searx',
          link: 'https://searx.be/?preferences=eJx1V8uu4zYM_ZpmE0zQdgoUXWRVoNsWaPcGLTE2x5Ko0SOJ79eX8iOW4zuLG1wdShTFxyGtIGHHgTBeO3QYwJwMuC5Dh1cwsmAFBq_oTpATK7beYMJrx9wZPJGVfY0P_Byv_4WMJ4upZ3395-9__ztFuGFECKq__nxKPVq8clQQTgFjNik27BqHjyZBe_0LTMSTZmpEyOaO4cogywuH7jSd-hLTKIYY7kixxvsXDWE4RSoGNbOsWHhS6BKGBgx1zsr_i2rQd3AKdbNYNKPfM4axIdckSqJgegK5GzlKolQFNmbZOR8rJqvZY6NoMqhW_T2nAcd41XgDedxJU4TWyH3oOnLi3T866JomsiIwZ4ua4Kdf_wTnIJ6LZrpj09zIYCywH86WQuBQY_LQs_yeY-JQb3ag2GloGkplGRIp-b9EZhKHJ93lYkUo7xegJUPlr2nupJHjBDmxbYn_sj7PGipNEzqf2Z1NbVYDpuX-1rc7VUlT123WKqW-pHt1nj06CXfE6iZxfIwBb7XZgj30nSRfKu0j-rfl0ewCSpoJVH6LphwM4c5I6F3PtxrSiB-SRo3NkdS0vhO4JN6tVGvdnSXgJV2IXazPP2ggDQl2OsVP5a_jz9Gj7ZXs4PhKtnvenCgWvEDyK0iSBBx3D_7lWV1y04FJbyG6GVJDqDcExHPkW3pAwLOmIGlfCmAO-C2QGwjqnOukmqBd5KVaWwzdspyZ4_icBY-qZwOhjvwi8QbGkv9xs7SWWJbkqBVaqdNQik34wtVO7TxrXce2hzZA-VlM7EHyOcxOnQCyXa4dQg6qi6ScAoTxXNwbqTLv48si2qB1L9_OYlUnZFdbZriNCS9hvRc-zBhIxc1U4VdQHtyywT5sa-rAOm8XkRsBtntZjxHxrewCeq7M9fJs6CiulezJC39tR3xY6Ly-8AUek3cTrcH-7Ngud31uL1JpqwG5tcWCLRW-P6QGaz0TcLx6hg85FtETrG-o0AKUND2Xn1dag4USrhWIaEUpqc9SNBZi8KUXVrYlHkZOHHseSsBWN0t7Iy31E6Q5Vd5PxXRRDXmno0IXH2UXJeFjX1Mc9LzjlJFzym0d7xfyIjQgM1ouxFVtu5NFrtYPasdascwCT3Ba6uqd7Frm4cCA3zMnfAcj56COqEc1FfAP4M3ZBS4dg9L4vvvO41sQHmzmSPp-z8Wk0ge7PSt-_fr7swoUfjiw9QbL3xCHXb3BvTDJBoTcjh3atYI9YniLxNT7ZRwaSjN7YFsHCdTuSWV9TO6Qpehxl8A4hH0hzdDh6Awf6-LeFS6oNhZnWulruy4Z4I4H4HKcEyb4cInU0sZscw70OW1dYUcPQ3fpeKWCE7r9LDURhyGXn-di6Dp5SGIqsH7L8SL0xd2H4WY_EPR4G7hwAktcwjwiSHnug6FRqjwVfl93aS594tzntdWhzCilk742bC36gSXmYZOhJNNq3AtLUpFOHoYbdhvHSqOYQ7nqB7JOxXWzEylttsy9sX7A0i0P8VrwnUv65fTS_nS7mUBOQkqc69hW2GrZNxLi204NMlNArPjOoLWjEK61uYxPU4nvh-N5R44YfiST9pV-JCuaZ4Z9F0v877uMsCAjtWb3g7te4l5YVwj5kx361ZDpqQxnXXVskOkI19GitF2QAaqMhhHTjtdWmbQ9mcBgGSn38phkFksy1q2zndeFXLZNXj5ECqMvUiofQxjroXVq65fJvM1KT0HGpRaqUUWmJCUvJ6fxucXRj36tt7nJ7tImgGTBuZUyiPWAJe_VlA5uC5xSyV-Z1BiruhJykEreu1FqTw0sZHsz_FjHozjkNruU1zwtj3UyIc3fU5_16ewx5PgKR9pl9tRG9w8qDPIOlMBMQ916rmwq6SbxOrKhHa2Uuox8KYCLRry8IwiNbltOM6wnw6lSzkE7GmrgSQM7IcdzHB070V-57pu_-EelUtgh3UoMw8H9D_m-74WqXc37KYULVefHbK2p3jqT-84lbfpt_cDbPnu9ycLV8VqGq-dlWV0Ymvkb_xHkC3uZvTaxfFHf5Gv8xgeJzEuN0LQaXr3g8wtKiS6ig45e2EIaOsr1MkCp4_USoULojXwfyh5bsu0kQ5xU3fV_BkZ6iQ==&q=',
        },
        {
          name: 'Chess',
          link: 'https://www.chess.com/home',
        },
      ],
    },
    {
      icon: 'newspaper',
      id: '2',
      links: [
        {
          name: 'Business-standard',
          link: 'https://www.business-standard.com/',
        },
        {
          name: 'Indian Express',
          link: 'https://indianexpress.com/',
        },
        {
          name: 'The Hindu',
          link: 'https://www.thehindu.com/',
        },
        {
          name: 'Down To Earth',
          link: 'https://www.downtoearth.org.in/news',
        },
      ],
    },
  ],

  // Second Links Container
  secondListsContainer: [
    {
      icon: 'binary',
      id: '3',
      links: [
        {
          name: 'Spotify',
          link: 'https://www.spotify.com',
        },
        {
          name: 'Reddit',
          link: 'https://www.reddit.com',
        },
        {
          name: 'Hashnode',
          link: 'https://www.hashnode.com',
        },
        {
          name: 'Pocket',
          link: 'https://www.pocket.com',
        },
      ],
    },
    {
      icon: 'github',
      id: '4',
      links: [
        {
          name: 'Front',
          link: 'https://www.reddit.com/r/Frontend/',
        },
        {
          name: 'Rust',
          link: 'https://www.reddit.com/r/rust/',
        },
        {
          name: 'Go',
          link: 'https://www.reddit.com/r/golang/',
        },
        {
          name: 'Repos',
          link: 'https://github.com/migueravila',
        },
      ],
    },
  ],
};
