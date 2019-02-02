package net.model;

import javax.persistence.*;

@Entity
@Table(name = "GAMES")
public class Game {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "GAME_PUBLISHER")
    private String gamePublisher;

    @Column(name = "GAME_NAME")
    private String gameName;

    @Column(name = "GAME_PRICE")
    private int gamePrice;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGamePublisher() {
        return gamePublisher;
    }

    public void setGamePublisher(String gamePublisher) {
        this.gamePublisher = gamePublisher;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public int getGamePrice() {
        return gamePrice;
    }

    public void setGamePrice(int gamePrice) {
        this.gamePrice = gamePrice;
    }

    @Override
    public String toString() {
        return "Game{" +
                "id=" + id +
                ", gamePublisher='" + gamePublisher + '\'' +
                ", gameName='" + gameName + '\'' +
                ", gamePrice=" + gamePrice +
                '}';
    }
}
