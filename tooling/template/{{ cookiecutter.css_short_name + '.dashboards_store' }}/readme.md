# {{ cookiecutter.css_short_name + '.dashboards_store' }}
> Helping students one dashboard at a time.


# I'have cookiecuttered the project, what's next ?
> Congrats ! You now have the backbone of a dashboards store. It's up to you to make it your own, and grow it ! 
> You can find below a list of things you might want to do next.

## 1. Update the `{{ cookiecutter.css_short_name + '.dashboards_store' }}/dbt_project.yml` file

This file contains some configuration you fill need to tune to you usecase. We advise you to go through the `core/readme.md` to get a better grasp of the different configuration options.

You will minimally have to enable some dashbaords and their corresponding interfaces. 
You also might need to replace the IP from the `databases` variables, to match your linked servers (if any.)

## 2. Add the content from `{{ cookiecutter.css_short_name + '.dashboards_store' }}/profiles-sample.yml` into your `~/.dbt/profiles.yml` file

We have already generated the profile to use to run the store for your (your are welcome :) ). But maybe you could add it to your other profiles ?

If this sentence does not make any sense at all, you schould go read the awsome ```dbt``` documentation [here](https://docs.getdbt.com/docs/profile).







