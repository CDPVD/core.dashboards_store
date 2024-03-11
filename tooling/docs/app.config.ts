export default defineAppConfig({
  docus: {
    title: 'Dashboard Store docs',
    description: 'Where dashboards happen.',
    socials: {
      github: 'Sciance-Inc/core.dashboards_store'
    },
    url: 'https://docs.dashboards-store.sciance.ca',
    github: {
      dir: 'content',
      branch: 'develop',
      repo: 'core.dashboards_store.docs',
      owner: 'Sciance-inc',
      edit: true
    },
    aside: {
      level: 0,
      collapsed: false,
      exclude: []
    },
    main: {
      padded: true,
      fluid: true
    },
    header: {
      logo: true,
      showLinkIcon: true,
      exclude: [],
      fluid: true
    },
    footer: {
      credits: {
        icon: 'IconDocus',
        text: 'Powered by Sciance Inc.',
        href: 'https://sciance.ca',
      },
    }
  }
})
