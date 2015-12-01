'use strict';

module.exports = {
  '/': {
    controller: require('../common/controllers/start'),
    next: '/inside-uk'
  },
  '/inside-uk': {
    fields: [
      'inside-uk',
      'country'
    ],
    next: '/date-lost'
  },
  '/date-lost': {
    controller: require('./controllers/date-lost'),
    fields: [
      'date-lost',
      'date-lost-day',
      'date-lost-month',
      'date-lost-year',
    ],
    backLink: 'inside-uk',
    next: '/personal-details'
  },
  '/personal-details': {
    controller: require('../common/controllers/personal-details'),
    fields: [
      'fullname',
      'date-of-birth',
      'date-of-birth-day',
      'date-of-birth-month',
      'date-of-birth-year',
      'nationality',
      'brp-card'
    ],
    backLink: 'date-lost',
    next: '/contact-details'
  },
  '/contact-details': {
    controller: require('./controllers/contact-details'),
    fields: [
      'email',
      'no-email',
      'contact-address-house-number',
      'contact-address-street',
      'contact-address-town',
      'contact-address-county',
      'contact-address-postcode',
      'phone'
    ],
    backLink: 'personal-details',
    next: '/confirm'
  },
  '/confirm': {
    controller: require('../common/controllers/confirm'),
    fields: [
      'org-help',
      'rep-name',
      'org-type'
    ],
    backLink: 'contact-details',
    next: '/confirmation'
  },
  '/confirmation': {
    controller: require('../common/controllers/confirmation'),
    backLink: false
  }
};
