# Trails-Diary
## Summary

- [About](#sobre)
- [Website](https://trailsdiary.herokuapp.com/)

# About

- Trails Diary is a site made for share experiencies, low budget travels and
  much more. Site inspired by the instagram: @viva.zaia

# config

- Run `docker-compose run --rm web rails db:create`
- Run bin/setup
- Run rails db:seed
- To run the discover a random trail you will need to configure the following
  environement variable on your .env file:
  - HIKING_PROJECT_API=
- hiking project: https://www.hikingproject.com/data


# Running

- Rename the file `.docker.env.sample` to `.env`
- Run `docker-compose run --rm --service-ports web bash`
- Run `Rails s -p 1000 -b 0.0.0.0`

# testing

- `docker-compose run --rm web bundle exec rspec spec`
