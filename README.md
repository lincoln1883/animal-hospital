### <a name="readme-top"></a>

<div align="center">

  <h3><b>🐕Animal Hospital🐈</b></h3>

</div>


<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 About Project <a name="about-project"></a>

 The Animal Hospital is a project in the Microverse curriculum that teaches us the basics of Database and SQL, covering the fundamentals from database and table creation to inserting and querying data.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[Schema to create a database table]**
- **[Inserting data into the table]**
- **[Querying the table for specific data]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

  - [coming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:
  to have postgres installed.
  - Linux:

```sh
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo apt-get update
  sudo apt-get -y install postgresql
```
  - Windows:
[Visit this website for detailed instructions](https://www.postgresql.org/download/windows/)

  - Mac:
[Visit this website for detailed instructions](https://www.postgresql.org/download/macosx/)

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:lincoln1883/animal-hospital.git
```


### Usage

To run the project, execute the following command:
```sh
  CREATE DATABASE vet_clinic;
```

```sh
  CREATE TABLE animals;
```

```sh
  INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (...);
```
```sh
  SELECT * FROM animals;
```


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Author1**

- GitHub: [lincoln1883](https://github.com/lincoln1883)
- Twitter: [lincolngibson7](https://twitter.com/lincolngibson7)
- LinkedIn: [lincoln-gibson](https://linkedin.com/in/lincoln-gibson)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[query and update animals table]**
- [ ] **[query multiple tables]**
- [ ] **[add "join table" for visits]**
- [ ] **[database performance audit]**
- [ ] **[add database schema diagram]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project and want to be apart of it drop me a message...

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank my family and Microverse for allowing me to persue my dreams

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **[What is PostgreSQL? How is it pronounced? What is Postgres?]**
  - PostgreSQL is pronounced Post-Gres-Q-L.

- **[Who controls PostgreSQL?]**
  - The project is directed by the community of developers and users, which anyone can join. All you need to do is subscribe to the mailing lists and participate in the discussions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
